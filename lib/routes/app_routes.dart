import 'package:get/get.dart';
import 'package:new_practice/features/auth/login/screen/login_screen.dart';

class AppRoutes{
  static const String login = '/login';
  static const String home = '/home';

  static final routes = [
    GetPage(name: login, page: () => LoginScreen()),
    // GetPage(name: home, page: () => HomeScreen()),
  ];
}