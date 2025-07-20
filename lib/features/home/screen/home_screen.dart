import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:new_practice/core/common/styles/global_color_style.dart';
import 'package:new_practice/features/auth/login/controller/auth_controller.dart';
import '../../auth/signout/controller/signout.dart';


class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  final AuthController authController = Get.find<AuthController>();
  final SignOutService signOutService = SignOutService();

  @override
  Widget build(BuildContext context) {
    print("🟢 HomeScreen Loaded");
    final user = authController.user;

    return Scaffold(
      backgroundColor: GlobalColorStyle.background,
      appBar: AppBar(
        title: Text('Home'),
        backgroundColor: GlobalColorStyle.primary,
        actions: [
          IconButton(onPressed: (){
            signOutService.signOut();
          }, icon: Icon(Icons.logout)),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (user?.photoURL != null)
              CircleAvatar(
                radius: 40,
                backgroundImage: NetworkImage(user!.photoURL!),
              )
            else
              Icon(Icons.person, size: 60),

            SizedBox(height: 20),

            Text(
              'Welcome, ${user?.displayName ?? "Guest!"}',
              style: TextStyle(fontSize: 20),
            )
          ],
        ),
      ),
    );
  }
}
