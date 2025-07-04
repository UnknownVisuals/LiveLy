import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:lively/features/authentication/controllers/login_controller.dart';
import 'package:lively/features/authentication/screens/password_config/forgot_password.dart';
import 'package:lively/features/authentication/screens/signup/signup.dart';
import 'package:lively/utils/constants/colors.dart';
import 'package:lively/utils/constants/sizes.dart';
import 'package:lively/utils/constants/text_string.dart';
import 'package:lively/utils/validators/validation.dart';

class LoginForm extends StatelessWidget {
  const LoginForm({super.key});

  @override
  Widget build(BuildContext context) {
    final LoginController loginController = Get.put(LoginController());
    final formKey = GlobalKey<FormState>();
    final TextEditingController emailController = TextEditingController();
    final TextEditingController passwordController = TextEditingController();

    return Obx(
      () => Form(
        key: formKey,
        child: Padding(
          padding: const EdgeInsets.symmetric(
            vertical: REYSizes.spaceBtwSections,
          ),
          child: Column(
            children: [
              // Email
              TextFormField(
                controller: emailController,
                validator: REYValidator.validateEmail,
                decoration: const InputDecoration(
                  prefixIcon: Icon(Iconsax.direct_right),
                  labelText: REYTexts.email,
                ),
              ),

              const SizedBox(height: REYSizes.spaceBtwInputFields),

              // Password
              TextFormField(
                controller: passwordController,
                obscureText: loginController.obscurePassword.value,
                validator: REYValidator.validatePassword,
                decoration: InputDecoration(
                  prefixIcon: const Icon(Iconsax.password_check),
                  labelText: REYTexts.password,
                  suffixIcon: IconButton(
                    icon: Icon(
                      loginController.obscurePassword.value
                          ? Iconsax.eye_slash
                          : Iconsax.eye,
                    ),
                    onPressed: loginController.toggleObscurePassword,
                  ),
                ),
              ),
              const SizedBox(height: REYSizes.spaceBtwInputFields / 2),

              // Remember Me & Forgot Password
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // Remember Me
                  Row(
                    children: [
                      Checkbox(
                        value: loginController.rememberMe.value,
                        onChanged: loginController.toggleRememberMe,
                      ),
                      const Text(REYTexts.rememberMe),
                    ],
                  ),

                  // Forgot Password
                  TextButton(
                    onPressed: () => Get.to(const ForgotPasswordScreen()),
                    child: const Text(
                      REYTexts.forgotPassword,
                      style: TextStyle(color: REYColors.primary),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: REYSizes.spaceBtwSections),

              // Signin Button
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    if (formKey.currentState!.validate()) {
                      loginController.loginWithEmail(
                        emailController.text,
                        passwordController.text,
                      );
                    }
                  },
                  child: const Text(REYTexts.signIn),
                ),
              ),
              const SizedBox(height: REYSizes.spaceBtwItems),

              // Create Account Button
              SizedBox(
                width: double.infinity,
                child: OutlinedButton(
                  onPressed: () => Get.to(const SignupScreen()),
                  child: const Text(REYTexts.createAccount),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
