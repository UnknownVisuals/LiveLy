import 'package:flutter/material.dart';
import 'package:lively/utils/constants/colors.dart';
import 'package:lively/utils/constants/image_string.dart';
import 'package:lively/utils/constants/sizes.dart';

class REYSocialButtons extends StatelessWidget {
  const REYSocialButtons({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(color: REYColors.grey),
          borderRadius: BorderRadius.circular(100),
        ),
        child: IconButton(
          onPressed: () {},
          icon: const Image(
            width: REYSizes.iconMd,
            height: REYSizes.iconMd,
            image: AssetImage(REYImages.google),
          ),
        ),
      ),
    );
  }
}
