import 'dart:core';
import 'dart:core';
import 'dart:io';

import 'package:flutter/material.dart' hide BoxDecoration, BoxShadow;
import 'package:flutter_inset_box_shadow/flutter_inset_box_shadow.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:green_vision/controller/comunity_controller.dart';
import 'package:image_picker/image_picker.dart';

import '../../constants/colors.dart';
import '../../controller/user_controller.dart';

class CreatecomunityPage extends StatefulWidget {

  @override
  _CreatecomunityPageState createState() => _CreatecomunityPageState();
}

class _CreatecomunityPageState extends State<CreatecomunityPage> {
  final _formKey = GlobalKey<FormState>();
  final UserController userController = Get.find();
  final ComunityController _comunityController = ComunityController();

  String title ='';
  String description ='';
  String authorId ='';
  XFile? _selectedImage;

  Future<void> _pickImage() async {
    final ImagePicker picker = ImagePicker();
    final XFile? image = await picker.pickImage(source: ImageSource.gallery);
    if (image != null) {
      setState(() {
        _selectedImage = image;
      });
    }
  }

  void _submitComunity() async {
    print("Submit button clicked!"); // Debugging log

    if (_formKey.currentState != null && _formKey.currentState!.validate()) {
      print("Form is valid!");  // Debugging log
      _formKey.currentState!.save();

      // Ambil authorId dari session
      final userInfo = await userController.getUserInfo();
      if (userInfo == null || userInfo['id'] == null) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('User information is missing')),
        );
        return;
      }

      String authorId = userInfo['id'];  // Ambil 'id' atau field yang benar sesuai dengan data pengguna

      try {
        final success = await _comunityController.createComunity(
          title: title,
          description: description,
          authorId: authorId,
          img: _selectedImage?.path ?? '',
        );

        if (success) {
          Navigator.pop(context, true);
        } else {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Failed to create community')),
          );
        }
      } catch (e) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Error: $e')),
        );
      }
    }
  }



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
                child: TextFormField(
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
                  onSaved: (value) => title = value!,
                  validator: (value) =>
                  value!.isNotEmpty ? 'Please enter a title' : null,
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
                child: TextFormField(
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
                  onSaved: (value) => description = value!,
                  validator: (value) =>
                  value!.isNotEmpty ? 'Please enter a title' : null,
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
                width: 360,
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
                child: Center(
                  child: _selectedImage == null
                  ? IconButton(
                    onPressed: _pickImage,
                    icon: const Icon(
                      Icons.add_a_photo,
                      size: 35,
                    ),
                    style: IconButton.styleFrom(
                      backgroundColor: AppColorsLight.primary,
                      foregroundColor: Colors.grey,
                    ),
                  ): Image.file(
                      File(_selectedImage!.path),
                    height: 165,
                    width: 360,
                  )
                ),
              ),
              const SizedBox(height: 150),
              SizedBox(
                width: 360,
                height: 55,
                child: InkWell(
                  onTap: _submitComunity,
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
