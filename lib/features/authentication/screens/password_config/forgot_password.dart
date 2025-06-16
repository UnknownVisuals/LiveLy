import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:lively/features/authentication/screens/password_config/reset_password.dart';
import 'package:lively/utils/constants/sizes.dart';
import 'package:lively/utils/constants/text_string.dart';

class ForgotPasswordScreen extends StatelessWidget {
  const ForgotPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(REYSizes.defaultSpace),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Headings
              Text(
                REYTexts.forgetPasswordTitle,
                style: Theme.of(context).textTheme.headlineMedium,
              ),
              const SizedBox(height: REYSizes.spaceBtwItems),
              Text(
                REYTexts.forgetPasswordSubTitle,
                style: Theme.of(context).textTheme.bodyMedium,
              ),
              const SizedBox(height: REYSizes.spaceBtwSections * 2),

              // TextFields
              TextFormField(
                decoration: const InputDecoration(
                  labelText: REYTexts.email,
                  prefixIcon: Icon(Iconsax.direct_right),
                ),
              ),
              const SizedBox(height: REYSizes.spaceBtwSections),

              // Submit Button
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () => Get.off(const ResetPasswordScreen()),
                  child: const Text(REYTexts.submit),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
