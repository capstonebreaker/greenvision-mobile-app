import 'package:flutter/material.dart' hide BoxDecoration, BoxShadow;
import 'package:flutter_inset_box_shadow/flutter_inset_box_shadow.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../constants/colors.dart';

class CreatecomunityPage extends StatelessWidget {
  const CreatecomunityPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColorsLight.primary,
      appBar: AppBar(
        backgroundColor: AppColorsLight.primary ,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text(
          'Tanya Komunitas',
          style: TextStyle(
            color: Colors.black,
            fontSize: 16,
            fontWeight: FontWeight.w400,
          ),
        ),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.only(top: 20, right: 24, left: 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Pertanyaan',
                style: GoogleFonts.quicksand(
                  fontWeight: FontWeight.bold,
                  fontSize: 14,
                  color: AppColorsLight.teksPrimary,),
              ),
              const SizedBox(height: 10),
              Container(
                height: 50,
                decoration: BoxDecoration(
                  color: AppColorsLight.primary,
                  borderRadius: BorderRadius.circular(10.0),
                  boxShadow: const [
                    BoxShadow(
                        blurRadius: 4,
                        offset: Offset(-4, -4),
                        color: Colors.white,
                        inset: true
                    ),
                    BoxShadow(
                        blurRadius: 4,
                        offset: Offset(4, 4),
                        color: Color(0xFFD4D4D4),
                        inset: true
                    ),
                  ],
                ),
                child: TextField(
                  decoration: InputDecoration(
                    hintText: 'Tambahkan Pertanyaan',
                    hintStyle: GoogleFonts.dmSans(
                      color: Colors.grey,
                      fontSize: 14,
                      fontWeight: FontWeight.normal,
                    ),
                    border: InputBorder.none,
                    contentPadding: const EdgeInsets.symmetric(
                        vertical: 14.0, horizontal: 16.0
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 45),
              Text(
                'Deskripsi',
                style: GoogleFonts.quicksand(
                  fontWeight: FontWeight.bold,
                  fontSize: 14,
                  color: AppColorsLight.teksPrimary,),
              ),
              const SizedBox(height: 10),
              Container(
                height: 165,
                decoration: BoxDecoration(
                  color: AppColorsLight.primary,
                  borderRadius: BorderRadius.circular(10.0),
                  boxShadow: const [
                    BoxShadow(
                        blurRadius: 4,
                        offset: Offset(-4, -4),
                        color: Colors.white,
                        inset: true
                    ),
                    BoxShadow(
                        blurRadius: 4,
                        offset: Offset(4, 4),
                        color: Color(0xFFD4D4D4),
                        inset: true
                    ),
                  ],
                ),
                child: TextField(
                  textAlign: TextAlign.center,
                  decoration: InputDecoration(
                    hintText: 'Jelaskan deskripsi',
                    hintStyle: GoogleFonts.dmSans(
                      color: Colors.grey,
                      fontSize: 14,
                      fontWeight: FontWeight.normal,
                    ),
                    border: InputBorder.none,
                    contentPadding: const EdgeInsets.symmetric(
                        vertical: 82.5, horizontal: 16.0
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 45),
              Text(
                'Tambahkan Gambar',
                style: GoogleFonts.quicksand(
                  fontWeight: FontWeight.bold,
                  fontSize: 14,
                  color: AppColorsLight.teksPrimary,),
              ),
              const SizedBox(height: 10),
              Container(
                height: 165,
                decoration: BoxDecoration(
                  color: AppColorsLight.primary,
                  borderRadius: BorderRadius.circular(10.0),
                  boxShadow: const [
                    BoxShadow(
                        blurRadius: 4,
                        offset: Offset(-4, -4),
                        color: Colors.white,
                        inset: true
                    ),
                    BoxShadow(
                        blurRadius: 4,
                        offset: Offset(4, 4),
                        color: Color(0xFFD4D4D4),
                        inset: true
                    ),
                  ],
                ),
                child: TextField(
                  textAlign: TextAlign.center,
                  decoration: InputDecoration(
                    hintText: '+ Upload Gambar',
                    hintStyle: GoogleFonts.dmSans(
                      color: Colors.grey,
                      fontSize: 14,
                      fontWeight: FontWeight.normal,
                    ),
                    border: InputBorder.none,
                    contentPadding: const EdgeInsets.symmetric(
                        vertical: 82.5, horizontal: 16.0
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 150),
              SizedBox(
                width: 360,
                height: 55,
                child: InkWell(
                  onTap: () {
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: AppColorsLight.primary,
                      boxShadow: const [
                        BoxShadow(
                          blurRadius: 4,
                          offset: Offset(-4, -4),
                          color: Colors.white,
                        ),
                        BoxShadow(
                          blurRadius: 4,
                          offset: Offset(4, 4),
                          color: Color(0xFFD4D4D4),
                        ),
                      ],
                    ),
                    child: Center(
                      child: Text(
                        "Kirim",
                        style: GoogleFonts.dmSans(
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
