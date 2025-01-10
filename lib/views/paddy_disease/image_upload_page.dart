import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:green_vision/routes/app_routes_named.dart';
import 'package:green_vision/views/paddy_disease/results_detection_page.dart';
import '../../constants/colors.dart';
import '../../controller/paddy_disease_controller.dart';
import '../../shared/widgets/buttom_nav_bar.dart';

class ImageUploadPage extends StatelessWidget {
  final PaddyDiseaseController controller = Get.put(PaddyDiseaseController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColorsLight.primary,
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 40.0),
            child: Column(
              children: [
                Obx(() => controller.image.value != null
                    ? Container(
                  height: 200,
                  width: 340,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: AppColorsLight.primary,
                    boxShadow: const [
                      BoxShadow(
                        color: Color(0xFFffffff),
                        offset: Offset(-2, -2),
                        blurRadius: 2,
                      ),
                      BoxShadow(
                        color: Color(0xFFbebebe),
                        offset: Offset(2, 2),
                        blurRadius: 2,
                      ),
                    ],
                  ),
                  child: Image.file(
                    controller.image.value!,
                    height: 200,
                    width: 340,
                    fit: BoxFit.cover,
                  ),
                )
                    : Container(
                  height: 200,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: AppColorsLight.primary,
                    boxShadow: const [
                      BoxShadow(
                        color: Color(0xFFffffff),
                        offset: Offset(-2, -2),
                        blurRadius: 2,
                      ),
                      BoxShadow(
                        color: Color(0xFFbebebe),
                        offset: Offset(2, 2),
                        blurRadius: 2,
                      ),
                    ],
                  ),
                  child: const Center(
                    child: Text('No image selected'),
                  ),
                ),
                ),
                SizedBox(height: 36),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      height: 45,
                      width: 170,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: AppColorsLight.primary,
                        boxShadow: const [
                          BoxShadow(
                            blurRadius: 3.0,
                            offset: Offset(-4, -4),
                            color: Colors.white,
                          ),
                          BoxShadow(
                            blurRadius: 3.0,
                            offset: Offset(4, 4),
                            color: Color(0xFFD4D4D4),
                          ),
                        ],
                      ),
                      child: ElevatedButton(
                        onPressed: controller.pickImage,
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.transparent,
                          shadowColor: Colors.transparent,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        child: const Text('Pick from Gallery',
                          style: TextStyle(
                            color: Color(0xFF09060D),
                            fontSize: 14,
                            fontWeight: FontWeight.normal,
                          ),
                        ),
                      ),
                    ),
                    Container(
                      height: 45,
                      width: 170,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: AppColorsLight.primary,
                        boxShadow: const [
                          BoxShadow(
                            blurRadius: 3.0,
                            offset: Offset(-4, -4),
                            color: Colors.white,
                          ),
                          BoxShadow(
                            blurRadius: 3.0,
                            offset: Offset(4, 4),
                            color: Color(0xFFD4D4D4),
                          ),
                        ],
                      ),
                      child: ElevatedButton(
                        onPressed: controller.pickImageFromCamera,
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.transparent,
                          shadowColor: Colors.transparent,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        child: const Text('Take with Camera',
                          style: TextStyle(
                            color: Color(0xFF09060D),
                            fontSize: 14,
                            fontWeight: FontWeight.normal,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 36),
                Obx(() => controller.isUploading.value
                    ? Container(
                  height: 45,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: AppColorsLight.primary,
                    boxShadow: const [
                      BoxShadow(
                        blurRadius: 3.0,
                        offset: Offset(-4, -4),
                        color: Colors.white,
                      ),
                      BoxShadow(
                        blurRadius: 3.0,
                        offset: Offset(4, 4),
                        color: Color(0xFFD4D4D4),
                      ),
                    ],
                  ),
                  child: Center(child: CircularProgressIndicator()),
                )
                    : Container(
                  height: 45,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: AppColorsLight.primary,
                    boxShadow: const [
                      BoxShadow(
                        blurRadius: 3.0,
                        offset: Offset(-4, -4),
                        color: Colors.white,
                      ),
                      BoxShadow(
                        blurRadius: 3.0,
                        offset: Offset(4, 4),
                        color: Color(0xFFD4D4D4),
                      ),
                    ],
                  ),
                    child: ElevatedButton(
                      onPressed: () {
                        controller.uploadImage();
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.transparent,
                        shadowColor: Colors.transparent,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      child: const Text(
                        'Konfirmasi & lihat Hasil Deteksi',
                        style: TextStyle(
                          color: Color(0xFF09060D),
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    )

                )),
                SizedBox(height: 16),
                Obx(() => controller.prediction.value != null
                    ? Align(
                  alignment: Alignment.bottomCenter,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0),
                    child: Container(
                      height: 180,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: AppColorsLight.primary,
                        boxShadow: const [
                          BoxShadow(
                            blurRadius: 3.0,
                            offset: Offset(-4, -4),
                            color: Colors.white,
                          ),
                          BoxShadow(
                            blurRadius: 3.0,
                            offset: Offset(4, 4),
                            color: Color(0xFFD4D4D4),
                          ),
                        ],
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              'Prediction: ${controller.prediction.value}',
                              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                            ),
                            SizedBox(height: 8),
                            Text(
                              'Accuration: ${controller.confidence.value}%',
                              style: TextStyle(fontSize: 20),
                            ),
                            SizedBox(height: 16),
                            ElevatedButton(
                              onPressed: () {
                                Get.toNamed(AppRoutesNamed.pageStore);
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: AppColorsLight.primary,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                elevation: 3,
                              ),
                              child: const Text(
                                'Pergi ke Toko Pupuk Terdekat',
                                style: TextStyle(
                                  color: Color(0xFF09060D),
                                  fontSize: 14,
                                  fontWeight: FontWeight.normal,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
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
