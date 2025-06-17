import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lively/features/authentication/screens/signup/widgets/signup_form.dart';
import 'package:lively/utils/constants/colors.dart';
import 'package:lively/utils/constants/sizes.dart';
import 'package:lively/utils/constants/text_string.dart';

class SignupScreen extends StatelessWidget {
  const SignupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          color: REYColors.black,
          onPressed: () => Get.back(),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(REYSizes.defaultSpace),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Title
              Text(
                REYTexts.signupTitle,
                style: Theme.of(context).textTheme.headlineMedium,
              ),
              const SizedBox(height: REYSizes.spaceBtwSections),

              // Form Fields
              const SignupForm(),
              const SizedBox(height: REYSizes.spaceBtwSections),

              // Divider
              // REYFormDivider(dividerText: REYTexts.orSignUpWith.capitalize!),
              // const SizedBox(height: REYSizes.spaceBtwSections),

              // Signup with Socials
              // const REYSocialButtons(),
            ],
          ),
        ),
      ),
    );
  }
}
