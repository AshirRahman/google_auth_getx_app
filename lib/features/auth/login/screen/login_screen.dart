import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controller/auth_controller.dart';

class LoginScreen extends StatelessWidget {
  final AuthController authController = Get.find<AuthController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Login with Google'), centerTitle: true),
      body: Center(
        child: Obx(() {
          if (authController.isSigningIn.value) {
            return CircularProgressIndicator();
          }

          return ElevatedButton(
            onPressed: () {
              authController.signInWithGoogle();
            },
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                SizedBox(width: 8),
                Text("Sign in with Google", style: TextStyle(color: Colors.black)),
              ],
            ),
          );
        }),
      ),
    );
  }
}
