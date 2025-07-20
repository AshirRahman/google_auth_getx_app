import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:new_practice/features/auth/login/screen/login_screen.dart';
import 'package:new_practice/firebase_options.dart';
import 'package:new_practice/routes/app_routes.dart';

import 'core/bindings/initial_bindings.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform
  );
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Google Auth with GetX',
      debugShowCheckedModeBanner: false,
      initialBinding: InitialBindings(),
      initialRoute: '/login',
      getPages: AppRoutes.routes,
    );
  }
}
