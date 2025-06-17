import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:lively/features/authentication/screens/login/login.dart';
import 'package:lively/features/monitoring/screens/monitoring.dart';
import 'package:lively/utils/popups/snackbar.dart';

class LoginController extends GetxController {
  final _auth = FirebaseAuth.instance;
  final _storage = GetStorage();
  Rx<bool> isLoading = false.obs;
  Rx<bool> rememberMe = false.obs;
  Rx<bool> obscurePassword = true.obs;

  @override
  void onInit() {
    super.onInit();
    _checkRememberedUser();
  }

  void toggleObscurePassword() {
    obscurePassword.value = !obscurePassword.value;
  }

  void toggleRememberMe(bool? value) {
    rememberMe.value = value ?? false;
  }

  void _checkRememberedUser() {
    final email = _storage.read('email');
    final password = _storage.read('password');
    if (email != null && password != null) {
      loginWithEmail(email, password);
    }
  }

  Future<void> loginWithEmail(String email, String password) async {
    try {
      isLoading.value = true;

      try {
        final userCredential = await _auth.signInWithEmailAndPassword(
          email: email,
          password: password,
        );

        if (userCredential.user != null) {
          if (rememberMe.value) {
            _storage.write('email', email);
            _storage.write('password', password);
          }

          Get.off(() => const MonitoringScreen());
        }
      } on FirebaseAuthException catch (e) {
        String message = '';
        switch (e.code) {
          case 'user-not-found':
            message = 'No user found for that email.';
            break;
          case 'wrong-password':
            message = 'Wrong password provided.';
            break;
          case 'invalid-email':
            message = 'The email address is badly formatted.';
            break;
          default:
            message = 'An error occurred. Please try again.';
        }
        throw message;
      }
    } catch (e) {
      REYLoaders.errorSnackBar(title: 'Error', message: e.toString());
    } finally {
      isLoading.value = false;
    }
  }

  void logout() {
    _storage.remove('email');
    _storage.remove('password');
    _auth.signOut();
    Get.offAll(() => const LoginScreen());
  }
}
