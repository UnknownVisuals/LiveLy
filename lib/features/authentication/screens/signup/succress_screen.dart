import 'package:flutter/material.dart';
import 'package:lively/utils/constants/sizes.dart';
import 'package:lively/utils/constants/text_string.dart';
import 'package:lively/utils/helpers/helper_functions.dart';

class SuccessScreen extends StatelessWidget {
  const SuccessScreen({
    super.key,
    required this.image,
    required this.title,
    required this.subTitle,
    required this.onPressed,
  });

  final String image, title, subTitle;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.fromLTRB(
            REYSizes.defaultSpace * 2,
            REYSizes.appBarHeight * 2,
            REYSizes.defaultSpace * 2,
            REYSizes.defaultSpace * 2,
          ),
          child: Column(
            children: [
              // Image
              Image(
                image: AssetImage(image),
                width: REYHelperFunctions.screenWidth() * 0.6,
              ),
              const SizedBox(height: REYSizes.spaceBtwSections),

              // Title & SubTitle
              Text(
                title,
                style: Theme.of(context).textTheme.headlineMedium,
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: REYSizes.spaceBtwItems),
              Text(
                subTitle,
                style: Theme.of(context).textTheme.labelMedium,
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: REYSizes.spaceBtwSections),

              // Button
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: onPressed,
                  child: const Text(REYTexts.rContinue),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
