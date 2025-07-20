import 'package:get/get.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:new_practice/routes/app_routes.dart';

class AuthController extends GetxController{
  var isSigningIn = false.obs;

  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GoogleSignIn _googleSignIn = GoogleSignIn();
  
  User? get user => _auth.currentUser;
  
  @override
  void onInit(){
    super.onInit();
    if (_auth.currentUser  != null){
      Future.microtask(() => Get.offAllNamed('/home'));
    }
  }

  Future<void> signInWithGoogle() async {
    try {
      isSigningIn.value = true;

      final googleUser = await _googleSignIn.signIn();
      if (googleUser == null){
        isSigningIn.value = false;
        return;
      }

      final googleAuth = await googleUser.authentication;
      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      await _auth.signInWithCredential(credential);
      Get.offAllNamed(AppRoutes.home);
    } catch (e) {
      Get.snackbar('Error', "Google Sign-In failed: $e");
    } finally{
      isSigningIn.value = false;
    }

    void signOut() async {
      await _googleSignIn.signOut();
      await _auth.signOut();
      Get.offAllNamed(AppRoutes.login);
    }
  }
}