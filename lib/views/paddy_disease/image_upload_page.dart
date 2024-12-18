import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:green_vision/routes/app_routes_named.dart';
import '../../controller/paddy_disease_controller.dart';
import '../../shared/widgets/buttom_nav_bar.dart';

class ImageUploadPage extends StatelessWidget {
  final PaddyDiseaseController controller = Get.put(PaddyDiseaseController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                Obx(() => controller.image.value != null
                    ? Image.file(controller.image.value!, height: 200)
                    : Container(
                  height: 200,
                  color: Colors.grey[200],
                  child: Center(child: Text('No image selected')),
                )),
                SizedBox(height: 16),
                ElevatedButton(
                  onPressed: controller.pickImage,
                  child: Text('Pick Image from Gallery'),
                ),
                ElevatedButton(
                  onPressed: controller.pickImageFromCamera,
                  child: Text('Take Photo with Camera'),
                ),
                SizedBox(height: 16),
                Obx(() => controller.isUploading.value
                    ? CircularProgressIndicator()
                    : ElevatedButton(
                  onPressed: controller.uploadImage,
                  child: Text('Upload Image'),
                )),
                SizedBox(height: 16),
                Obx(() => controller.prediction.value != null
                    ? Column(
                      children: [
                        Text('Prediction: ${controller.prediction.value}',
                        style: TextStyle(fontSize: 20)),
                        ElevatedButton(
                          onPressed: () {
                            Get.toNamed(AppRoutesNamed.pageStore, transition: Transition.fade, duration: const Duration(milliseconds: 500));
                          },
                          child: Text('Pergi ke Toko Pupuk Terdekat'),
                        )
                      ],
                    )
                    : Container()),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: BottomNavBar(),
    );
  }
}
