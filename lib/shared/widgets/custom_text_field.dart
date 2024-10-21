import 'package:flutter/material.dart';
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
    this.leadingIconPath, // Initialize the leading icon path
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      keyboardType: keyboardType,
      obscureText: obscureText,
      style: TextStyle(color: Colors.white), // Set text color to black
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: GoogleFonts.dmSans(
          color: Colors.white, // Set hint text color
          fontSize: 14, // Set hint text size
          fontWeight: FontWeight.normal,
        ), // Set hint text color
        filled: true,
        fillColor: AppColorsDark.aksen, // Background color of the text field
        border: OutlineInputBorder(
          borderRadius:
          BorderRadius.circular(10.0), // Border radius for rectangle
          borderSide: BorderSide(color: Colors.grey), // Border color
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius:
          BorderRadius.circular(10.0), // Border radius for focused state
          borderSide:
          BorderSide(color: Colors.blue), // Border color when focused
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius:
          BorderRadius.circular(10.0), // Border radius for enabled state
          borderSide:
          BorderSide(color: Colors.white), // Border color when enabled
        ),
        prefixIcon: leadingIconPath != null
            ? Padding(
          padding: const EdgeInsets.all(12.0),
          child: Image.asset(
            leadingIconPath!,
            height: 20, // Adjust height as needed
            width: 20, // Adjust width as needed
          ),
        )
            : null, // If no icon path provided, don't show any icon
        contentPadding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 14.0),
      ),
    );
  }
}
