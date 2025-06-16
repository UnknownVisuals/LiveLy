import 'package:flutter/material.dart';
import 'package:lively/utils/constants/colors.dart';
import 'package:lively/utils/constants/sizes.dart';

class MonitoringCard extends StatelessWidget {
  const MonitoringCard({
    super.key,
    required this.icon,
    required this.value,
    required this.unit,
    required this.label,
  });

  final IconData icon;
  final String value, unit, label;

  @override
  Widget build(BuildContext context) {
    return Card(
      surfaceTintColor: REYColors.white,
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              flex: 1,
              child: Container(
                alignment: Alignment.topLeft,
                child: Icon(
                  icon,
                  size: REYSizes.imageThumbSize,
                  color: REYColors.darkerGrey,
                ),
              ),
            ),
            const SizedBox(width: REYSizes.spaceBtwItems),
            Expanded(
              flex: 2,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Expanded(
                    child: Container(
                      alignment: Alignment.topRight,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text(
                            value,
                            style: Theme.of(context).textTheme.headlineLarge
                                ?.copyWith(color: REYColors.primary),
                          ),
                          const SizedBox(width: REYSizes.xs),
                          Text(
                            unit,
                            style: Theme.of(context).textTheme.headlineSmall
                                ?.copyWith(color: REYColors.darkerGrey),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: REYSizes.spaceBtwItems),
                  Expanded(
                    child: Container(
                      alignment: Alignment.bottomRight,
                      child: Text(
                        label,
                        style: Theme.of(context).textTheme.titleLarge,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
