import 'package:flutter/material.dart';

import '../../../features/auth/login/controller/auth_controller.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    required this.authController, required this.logo,

  });

  final AuthController authController;
  final String logo;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        authController.signInWithGoogle();
      },
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.white,
        shape: const CircleBorder(),
        elevation: 6,
        shadowColor: Colors.grey.withOpacity(0.5),
        padding: const EdgeInsets.all(3), // Adjusts the size around the logo
      ),
      child: Image.asset(
        logo,
        width: 60,
        height: 60,
      ),
    );
  }
}

class CustomLogo {

}