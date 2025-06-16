import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lively/common/form_divider.dart';
import 'package:lively/common/social_button.dart';
import 'package:lively/features/authentication/screens/login/widgets/login_form.dart';
import 'package:lively/features/authentication/screens/login/widgets/login_header.dart';
import 'package:lively/utils/constants/sizes.dart';
import 'package:lively/utils/constants/text_string.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        padding: EdgeInsets.fromLTRB(
          REYSizes.defaultSpace,
          REYSizes.appBarHeight,
          REYSizes.defaultSpace,
          REYSizes.defaultSpace,
        ),
        child: Column(
          children: [
            // Header
            LoginHeader(),

            // Forms
            LoginForm(),

            // Divider
            REYFormDivider(dividerText: REYTexts.orSignInWith.capitalize!),
            const SizedBox(height: REYSizes.spaceBtwSections),

            // Signin with Socials
            const REYSocialButtons(),
          ],
        ),
      ),
    );
  }
}
