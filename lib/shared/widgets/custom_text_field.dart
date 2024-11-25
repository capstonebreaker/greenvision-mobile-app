import 'package:flutter/material.dart' hide BoxDecoration, BoxShadow;
import 'package:flutter_inset_box_shadow/flutter_inset_box_shadow.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:green_vision/constants/colors.dart';

class CustomTextField extends StatelessWidget {
  final String hintText;
  final TextEditingController controller;
  final TextInputType keyboardType;
  final bool obscureText;
  final String? leadingIconPath; // Path to the asset icon

  CustomTextField({
    Key? key,
    required this.hintText,
    required this.controller,
    this.keyboardType = TextInputType.text,
    this.obscureText = false,
    this.leadingIconPath,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 55,
      decoration: BoxDecoration(
        color: AppColorsLight.primary,
        borderRadius: BorderRadius.circular(10.0),
        boxShadow: const [
          BoxShadow(
            color: Colors.white,
            offset: Offset(-4, -4),
            blurRadius: 8,
            inset: true,
          ),
          BoxShadow(
            color: Color(0xFFD4D4D4),
            offset: Offset(4, 4),
            blurRadius: 8,
            inset: true,
          ),
        ],
      ),
      child: Row(
        children: [
          if (leadingIconPath != null)
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30.0),
              child: Image.asset(
                leadingIconPath!,
                height: 20,
                width: 20,
                color: Colors.grey,
              ),
            ),
          Expanded(
            child: TextField(
              controller: controller,
              keyboardType: keyboardType,
              obscureText: obscureText,
              style: GoogleFonts.dmSans(
                color: Colors.black,
                fontSize: 14,
              ),
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: hintText,
                hintStyle: GoogleFonts.dmSans(
                  color: Colors.grey,
                  fontSize: 14,
                  fontWeight: FontWeight.normal,
                ),
                contentPadding: const EdgeInsets.symmetric(
                    vertical: 14.0
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
