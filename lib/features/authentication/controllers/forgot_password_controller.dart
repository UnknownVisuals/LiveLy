import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:lively/utils/popups/snackbar.dart';

class ForgotPasswordController extends GetxController {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<void> forgotPassword(String email) async {
    if (email.isEmpty || !email.contains('@')) {
      REYLoaders.errorSnackBar(
        title: 'Invalid Email',
        message: 'Please enter a valid email address.',
      );
      return;
    }
    await sendPasswordResetEmail(email);
  }

  Future<void> sendPasswordResetEmail(String email) async {
    try {
      await _auth.sendPasswordResetEmail(email: email);
      REYLoaders.successSnackBar(
        title: 'Success',
        message: 'Password reset email sent successfully.',
      );
    } catch (e) {
      REYLoaders.errorSnackBar(title: 'Error', message: e.toString());
    }
  }
}
