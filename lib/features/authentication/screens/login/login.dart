import 'package:flutter/material.dart';
import 'package:lively/features/authentication/screens/login/widgets/login_form.dart';
import 'package:lively/features/authentication/screens/login/widgets/login_header.dart';
import 'package:lively/utils/constants/sizes.dart';

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
          ],
        ),
      ),
    );
  }
}
