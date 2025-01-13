import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:http/http.dart' as http;
import '../views/paddy_disease/results_detection_page.dart';
import 'api_controller.dart';

class PaddyDiseaseController extends GetxController {
  final ApiController controller = Get.put(ApiController());
  var image = Rx<File?>(null);
  var prediction = Rx<String?>(null);
  var confidence = Rx<double?>(null);
  var isUploading = false.obs;
  final ImagePicker picker = ImagePicker();

  Future<void> pickImage() async {
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      image.value = File(pickedFile.path);
    }
  }

  Future<void> pickImageFromCamera() async {
    final pickedFile = await picker.pickImage(source: ImageSource.camera);
    if (pickedFile != null) {
      image.value = File(pickedFile.path);
    }
  }

  Future<void> uploadImage() async {
    if (image.value == null) {
      Get.snackbar('Error', 'Please select an image first!');
      return;
    }

    isUploading(true);

    final request = http.MultipartRequest(
      'POST',
      Uri.parse(controller.detectionAPI.value),
    );
    request.files.add(
      await http.MultipartFile.fromPath('file', image.value!.path),
    );

    final response = await request.send();
    if (response.statusCode == 200) {
      final responseData = await response.stream.bytesToString();
      final decodedResponse = jsonDecode(responseData);
      prediction.value = decodedResponse['prediction'];
      confidence.value = decodedResponse['confidence'];

      if (prediction.value != 'non-leaf' && confidence.value! >= 50.0) {
        Get.to(() => ResultsDetectionPage(), arguments: {
          'prediction': prediction.value,
          'confidence': confidence.value,
        });
      } else {
        // Tangani hasil 'non-leaf' atau confidence rendah
        Get.defaultDialog(
          title: 'Gambar Tidak Valid',
          middleText: prediction.value == 'non-leaf'
              ? 'Gambar yang Anda unggah bukan daun.'
              : 'Kepercayaan hasil deteksi rendah (${confidence.value}%).',
          textConfirm: 'OK',
          confirmTextColor: Colors.white,
          onConfirm: () {
            Get.back();
          },
        );
      }
    } else {
      Get.snackbar('Error', 'Error uploading image');
    }
    isUploading(false);
  }
}
