import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../constants/colors.dart';
import '../../controller/store_controller.dart';
import '../../shared/widgets/buttom_nav_bar.dart';

class StorePage extends StatelessWidget {
  final StoreController _storeController = Get.put(StoreController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColorsLight.primary,
      appBar: AppBar(
        leading: const Icon(Icons.arrow_back_ios_new),
        title: Text(
          "Cari toko pupuk",
          style: GoogleFonts.dmSans(fontSize: 14, fontWeight: FontWeight.normal),
        ),
      ),
      body: Obx(() {
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
                Text(
                  "Alamat Toko Pupuk Terdekat dengan anda",
                  style: GoogleFonts.dmSans(
                      fontSize: 16, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 40),
                Expanded(
                  child: GridView.builder(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
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
                          boxShadow: [
                            BoxShadow(
                              blurRadius: 12.0,
                              offset: const Offset(-8, -8),
                              color: Colors.white,
                            ),
                            const BoxShadow(
                              blurRadius: 12.0,
                              offset: Offset(8, 8),
                              color: Color(0xFFD4D4D4),
                            ),
                          ],
                          color: AppColorsLight.aksen,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(9),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              AspectRatio(
                                aspectRatio: 16 / 9,
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(6),
                                  ),
                                  child: place['featured_image'] != null
                                      ? Image.network(
                                    place['featured_image'] ?? '',
                                    fit: BoxFit.cover,
                                  )
                                      : const Center(child: Text('No Image')),
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
                                      place['full_address'] ?? 'No Address',
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
                ),
              ],
            ),
          );
        } else {
          return const Center(child: Text('No data found'));
        }
      }),
      bottomNavigationBar: BottomNavBar(),
    );
  }
}
