import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lively/features/authentication/models/user_model.dart';
import 'package:lively/features/authentication/screens/signup/verify_email.dart';
import 'package:lively/utils/popups/snackbar.dart';

class SignupController extends GetxController {
  var obscurePassword = true.obs;
  var agreeTnC = false.obs;
  var selectedGender = ''.obs;
  var selectedBirthDate = Rx<DateTime?>(null);

  final firstNameController = TextEditingController();
  final lastNameController = TextEditingController();
  final usernameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  void togglePasswordVisibility() {
    obscurePassword.value = !obscurePassword.value;
  }

  void toggleAgreeToC(bool? value) {
    agreeTnC.value = value ?? false;
  }

  void setGender(String? gender) {
    selectedGender.value = gender ?? '';
  }

  Future<void> pickBirthDate() async {
    final DateTime? pickedDate = await showDatePicker(
      context: Get.context!,
      initialDate: DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
    );
    if (pickedDate != null) {
      selectedBirthDate.value = pickedDate;
    }
  }

  Future<void> signup() async {
    try {
      final UserCredential userCredential = await _auth
          .createUserWithEmailAndPassword(
            email: emailController.text,
            password: passwordController.text,
          );

      final user = UserModel(
        firstName: firstNameController.text,
        lastName: lastNameController.text,
        username: usernameController.text,
        gender: selectedGender.value,
        birthDate: selectedBirthDate.value!,
        email: emailController.text,
        password: passwordController.text,
      );

      await _firestore
          .collection('users')
          .doc(userCredential.user!.uid)
          .set(user.toJson());

      Get.to(const VerifyEmailScreen());
    } catch (e) {
      REYLoaders.errorSnackBar(title: 'Signup Error', message: e.toString());
    }
  }
}
