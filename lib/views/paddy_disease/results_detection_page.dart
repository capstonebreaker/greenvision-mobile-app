import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../constants/colors.dart';
import '../../controller/paddy_disease_controller.dart';
import '../../controller/store_controller.dart';
import '../../routes/app_routes_named.dart';

class ResultsDetectionPage extends StatelessWidget {
  final PaddyDiseaseController controller = Get.put(PaddyDiseaseController());
  final StoreController _storeController = Get.put(StoreController());

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
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(
                top: 26.0, bottom: 16.0, left: 28.0, right: 28.0),
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
                          // Kontainer hasil diagnosis
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
                              Expanded(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Prediction: ${controller.prediction.value}',
                                      style: const TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    const SizedBox(height: 12),
                                    Text(
                                      'Accuracy: ${controller.confidence.value}%',
                                      style: const TextStyle(fontSize: 12),
                                    ),
                                  ],
                                ),
                              )
                            ],
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
                const SizedBox(height: 10.0),
                Obx(() {
                  if (_storeController.isLoading.value) {
                    return const Center(child: CircularProgressIndicator());
                  } else if (_storeController.errorMessage.value.isNotEmpty) {
                    return Center(child: Text(_storeController.errorMessage.value));
                  } else if (_storeController.locations.isNotEmpty) {
                    List places = _storeController.locations;
                    return Padding(
                      padding: const EdgeInsets.all(15),
                      child: Column(
                        children: [
                          GridView.builder(
                            shrinkWrap: true, // Ini penting untuk menghindari error ukuran
                            physics: const NeverScrollableScrollPhysics(), // Agar tidak ada scroll dalam grid
                            gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              crossAxisSpacing: 10,
                              mainAxisSpacing: 10,
                              childAspectRatio: 0.7,
                            ),
                            itemCount: places.length,
                            itemBuilder: (context, index) {
                              final place = places[index];
                              return Container(
                                decoration: BoxDecoration(
                                  color: AppColorsLight.aksen,
                                  borderRadius: BorderRadius.circular(10),
                                  boxShadow: const [
                                    BoxShadow(
                                      blurRadius: 12.0,
                                      offset: Offset(-8, -8),
                                      color: Colors.white,
                                    ),
                                    BoxShadow(
                                      blurRadius: 12.0,
                                      offset: Offset(8, 8),
                                      color: Color(0xFFD4D4D4),
                                    ),
                                  ],
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(9),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      AspectRatio(
                                        aspectRatio: 16 / 9,
                                        child: Container(
                                          decoration: BoxDecoration(
                                            color: Colors.white,
                                            borderRadius:
                                            BorderRadius.circular(6),
                                          ),
                                          child: place['featured_image'] != null
                                              ? Image.network(
                                            place['featured_image'] ?? '',
                                            fit: BoxFit.cover,
                                          )
                                              : const Center(
                                            child: Text('No Image'),
                                          ),
                                        ),
                                      ),
                                      const SizedBox(height: 9),
                                      Text(
                                        place['name'] ?? 'No Name',
                                        style: GoogleFonts.sora(
                                          fontWeight: FontWeight.w600,
                                          fontSize: 10,
                                        ),
                                      ),
                                      Text(
                                        place['category'] ?? 'No Category',
                                        style: GoogleFonts.sora(
                                          fontWeight: FontWeight.normal,
                                          fontSize: 6,
                                          color: Colors.grey,
                                        ),
                                      ),
                                      const SizedBox(height: 10),
                                      Row(
                                        children: [
                                          const Icon(Icons.location_on, size: 8),
                                          const SizedBox(width: 6),
                                          Expanded(
                                            child: Text(
                                              place['full_address'] ??
                                                  'No Address',
                                              style: GoogleFonts.sora(
                                                fontWeight: FontWeight.normal,
                                                fontSize: 6,
                                                color: Colors.grey,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            },
                          ),
                        ],
                      ),
                    );
                  } else {
                    return const Center(child: Text('No data found'));
                  }
                })
              ],
            ),
          ),
        ),
      ),
    );
  }
}