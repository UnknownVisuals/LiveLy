import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:lively/features/authentication/screens/login/login.dart';
import 'package:lively/features/monitoring/screens/widgets/monitoring_card.dart';
import 'package:lively/utils/constants/image_string.dart';
import 'package:lively/utils/constants/sizes.dart';
import 'package:lively/utils/constants/text_string.dart';

class MonitoringScreen extends StatelessWidget {
  const MonitoringScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> monitoringData = [
      {
        'icon': Iconsax.activity,
        'value': '72',
        'unit': 'bpm',
        'label': 'Heart Rate',
      },
      {
        'icon': Iconsax.heart_circle,
        'value': '120/80',
        'unit': 'mmHg',
        'label': 'Blood Pressure',
      },
      {'icon': Iconsax.cloud, 'value': '98', 'unit': '%', 'label': 'Oxygen'},
      {
        'icon': Iconsax.sun,
        'value': '36.6',
        'unit': '°C',
        'label': 'Temperature',
      },
    ];

    return Scaffold(
      appBar: AppBar(
        leading: Padding(
          padding: const EdgeInsets.all(REYSizes.sm),
          child: Image(image: const AssetImage(REYImages.logo)),
        ),
        actions: [
          IconButton(
            onPressed: () => Get.offAll(const LoginScreen()),
            icon: const Icon(Iconsax.logout),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(REYSizes.defaultSpace),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Title
            Text(
              REYTexts.dashboardTitle,
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            const SizedBox(height: REYSizes.spaceBtwSections),

            // Monitoring Cards
            Expanded(
              child: LayoutBuilder(
                builder: (context, constraints) {
                  return Column(
                    children: List.generate(
                      monitoringData.length,
                      (index) => Expanded(
                        child: Padding(
                          padding: const EdgeInsets.only(
                            bottom: REYSizes.spaceBtwItems,
                          ),
                          child: MonitoringCard(
                            icon: monitoringData[index]['icon'],
                            value: monitoringData[index]['value'],
                            unit: monitoringData[index]['unit'],
                            label: monitoringData[index]['label'],
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
