import 'package:get/get.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:new_practice/routes/app_routes.dart';

class GoogleAuthController extends GetxController {
  var isSigningIn = false.obs;

  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  final GoogleSignIn _googleSignIn = GoogleSignIn(scopes: ['email', 'profile']);

  User? get user => _firebaseAuth.currentUser;

  @override
  void onInit() {
    super.onInit();
    if (_firebaseAuth.currentUser != null) {
      Future.microtask(() => Get.offAllNamed('/home'));
    }
  }

  Future<void> signInWithGoogle() async {
    try {
      isSigningIn.value = true;
      print("🔵 Signing in...");

      await _googleSignIn.signOut();
      final googleUser = await _googleSignIn.signIn();
      if (googleUser == null) {
        print("🟡 Google user is null (cancelled)");
        isSigningIn.value = false;
        return;
      }
      print('user: ${googleUser.displayName}');

      final googleAuth = await googleUser.authentication;
      print('auth: ${googleAuth.idToken}');
      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      await FirebaseAuth.instance.signInWithCredential(credential);
      Get.offAllNamed(AppRoutes.home);
    } catch (e) {
      print("🔴 Sign-in error: $e");
      Get.snackbar('Error', "Google Sign-In failed: $e");
    } finally {
      isSigningIn.value = false;
    }
  }
}
