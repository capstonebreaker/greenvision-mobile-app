import 'package:flutter/material.dart' hide BoxDecoration, BoxShadow;
import 'package:flutter_inset_box_shadow/flutter_inset_box_shadow.dart';
import 'package:green_vision/constants/colors.dart';

class EditProfilePage extends StatelessWidget {
  const EditProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: AppColorsLight.primary,
      appBar: AppBar(
        backgroundColor: AppColorsLight.primary,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text("Edit Profile"),
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 30.0),
        child: Container(
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(45.0),
              topRight: Radius.circular(45.0),
            ),
            color: AppColorsLight.primary,
            boxShadow: [
              BoxShadow(
                blurRadius: 12.0,
                offset: Offset(-8, -8),
                color: Color(0xFFD4D4D4),
              ),
              BoxShadow(
                blurRadius: 12.0,
                offset: Offset(8, 8),
                color: Color(0xFFD4D4D4),
              ),
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 30),
                child: Center(
                  child: Container(
                    width: 150,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: Colors.black.withOpacity(0.5),
                        width: 2.0,
                      ),
                    ),
                    child: const CircleAvatar(
                      radius: 55,
                      backgroundImage: ExactAssetImage('assets/images/avatar/avatar.png'),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 5),
              const Center(
                child: Column(
                  children: [
                    Text(
                      'Loki Laufeyson',
                      style: TextStyle(
                        color: AppColorsLight.teksPrimary,
                        fontSize: 21,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ],
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(top: 20, right: 24, left: 30),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Additional profile details can go here
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
