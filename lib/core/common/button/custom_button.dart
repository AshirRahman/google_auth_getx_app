import 'package:flutter/material.dart';
import 'package:new_practice/features/auth/login/controller/google_auth_controller.dart';

class CustomButton extends StatelessWidget {
  final String logo;
  final VoidCallback onPressed;

  const CustomButton({
    super.key,
    required this.logo,
    required this.onPressed, required GoogleAuthController authController,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.white,
        shape: const CircleBorder(),
        elevation: 6,
        shadowColor: Colors.grey.withOpacity(0.5),
        padding: const EdgeInsets.all(3),
      ),
      child: Image.asset(
        logo,
        width: 60,
        height: 60,
      ),
    );
  }
}
