import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../constants/colors.dart';
import '../../controller/paddy_disease_controller.dart';
import '../../routes/app_routes_named.dart';

class ResultsDetectionPage extends StatelessWidget {
  final PaddyDiseaseController controller = Get.put(PaddyDiseaseController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColorsLight.primary,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text('Diagnosis'),
      ),
      backgroundColor: AppColorsLight.primary,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(top: 26.0, bottom: 16.0, left: 28.0, right: 28.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Padding(
                padding: EdgeInsets.only(left: 8.0),
                child: Text(
                  'Hasil Diagnosis',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const SizedBox(height: 10.0),

              // Obx widget dengan penanganan loading, error, dan data kosong
              Obx(() {
                if (controller.prediction.value == null) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                } else if (controller.confidence.value == 0) {
                  return const Center(
                    child: Text(
                      'Tidak ada prediksi yang tersedia',
                      style: TextStyle(fontSize: 12, color: Colors.red),
                    ),
                  );
                } else {
                  return Align(
                    alignment: Alignment.bottomCenter,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 12.0),
                      child: Container(
                        width: 340,
                        height: 106,
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
                        padding: const EdgeInsets.symmetric(
                            horizontal: 19.0, vertical: 15.0),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Center(
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(15.0),
                                child: Image.file(
                                  controller.image.value!,
                                  height: 70,
                                  width: 70,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            const SizedBox(width: 14.0),
                            Expanded(child:
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Prediction: ${controller.prediction.value}',
                                  style: const TextStyle(
                                      fontSize: 20, fontWeight: FontWeight.bold),
                                ),
                                const SizedBox(height: 12),
                                Text(
                                  'Accuration: ${controller.confidence.value}%',
                                  style: const TextStyle(fontSize: 12),
                                ),
                              ],
                            ),
                            )
                          ]
                        ),
                      ),
                    ),
                  );
                }
              }),
              const SizedBox(height: 20.0),
              const Padding(
                padding: EdgeInsets.only(left: 8.0),
                child: Text(
                  'Rekomendasi Toko',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              // codingan tokone hit hehe
              // ElevatedButton(
              //   onPressed: () {
              //     Get.toNamed(AppRoutesNamed.pageStore);
              //   },
              //   style: ElevatedButton.styleFrom(
              //     backgroundColor: AppColorsLight.primary,
              //     shape: RoundedRectangleBorder(
              //       borderRadius: BorderRadius.circular(20),
              //     ),
              //     elevation: 3,
              //   ),
              //   child: const Text(
              //     'Pergi ke Toko Pupuk Terdekat',
              //     style: TextStyle(
              //       color: Color(0xFF09060D),
              //       fontSize: 14,
              //       fontWeight: FontWeight.normal,
              //     ),
              //   ),
              // ),
            ],
          ),
        ),
      ),
    );
  }
}
