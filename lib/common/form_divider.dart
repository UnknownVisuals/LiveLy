import 'package:flutter/material.dart';
import 'package:lively/utils/constants/colors.dart';

class REYFormDivider extends StatelessWidget {
  const REYFormDivider({super.key, required this.dividerText});

  final String dividerText;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Flexible(
          child: Divider(
            color: REYColors.darkGrey,
            thickness: 0.5,
            indent: 30,
            endIndent: 10,
          ),
        ),
        Text(dividerText, style: Theme.of(context).textTheme.labelMedium),
        Flexible(
          child: Divider(
            color: REYColors.darkGrey,
            thickness: 0.5,
            indent: 10,
            endIndent: 30,
          ),
        ),
      ],
    );
  }
}
