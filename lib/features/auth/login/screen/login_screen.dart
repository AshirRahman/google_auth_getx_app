import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:new_practice/core/common/styles/global_color_style.dart';
import '../../../../core/common/button/custom_button.dart';
import '../controller/auth_controller.dart';

class LoginScreen extends StatelessWidget {
  final AuthController authController = Get.find<AuthController>();

   LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Login with Google',
          style: TextStyle(color: GlobalColorStyle.background),
        ),
        centerTitle: true,
        backgroundColor: GlobalColorStyle.primary,
      ),
      body: Center(
        child: Obx(() {
          if (authController.isSigningIn.value) {
            return CircularProgressIndicator();
          }
          return CustomButton(
            authController: authController,
            logo: 'assets/images/logo/google.png',
          );
        }),
      ),
    );
  }
}
