import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:lively/features/authentication/controllers/login_controller.dart';
import 'package:lively/features/monitoring/controllers/monitoring_controller.dart';
import 'package:lively/features/monitoring/screens/widgets/monitoring_card.dart';
import 'package:lively/utils/constants/image_string.dart';
import 'package:lively/utils/constants/sizes.dart';
import 'package:lively/utils/constants/text_string.dart';

class MonitoringScreen extends StatelessWidget {
  const MonitoringScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(MonitoringController());
    final loginController = Get.find<LoginController>();

    return Scaffold(
      appBar: AppBar(
        leading: const Padding(
          padding: EdgeInsets.all(REYSizes.sm),
          child: Image(image: AssetImage(REYImages.logo)),
        ),
        actions: [
          IconButton(
            onPressed: () {
              Get.dialog(
                AlertDialog(
                  title: const Text('Logout Confirmation'),
                  content: const Text('Are you sure you want to log out?'),
                  actions: [
                    TextButton(
                      onPressed: () => Get.back(),
                      child: const Text('Cancel'),
                    ),
                    TextButton(
                      onPressed: () {
                        Get.back();
                        loginController.logout();
                      },
                      child: const Text('Logout'),
                    ),
                  ],
                ),
              );
            },
            icon: const Icon(Iconsax.logout),
          ),
        ],
      ),
      body: LayoutBuilder(
        builder: (context, constraints) {
          return Padding(
            padding: const EdgeInsets.all(REYSizes.defaultSpace),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  REYTexts.dashboardTitle,
                  style: Theme.of(context).textTheme.headlineMedium,
                ),
                const SizedBox(height: REYSizes.spaceBtwSections),

                // Error message
                Obx(() {
                  if (controller.error.isEmpty) return const SizedBox.shrink();
                  return Container(
                    padding: const EdgeInsets.all(REYSizes.sm),
                    margin: const EdgeInsets.only(
                      bottom: REYSizes.spaceBtwItems,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.red.shade100,
                      borderRadius: BorderRadius.circular(REYSizes.sm),
                    ),
                    child: Row(
                      children: [
                        Icon(Iconsax.warning_2, color: Colors.red.shade700),
                        const SizedBox(width: REYSizes.xs),
                        Expanded(
                          child: Text(
                            controller.error,
                            style: TextStyle(color: Colors.red.shade700),
                          ),
                        ),
                        IconButton(
                          onPressed: controller.refresh,
                          icon: Icon(
                            Iconsax.refresh,
                            color: Colors.red.shade700,
                          ),
                        ),
                      ],
                    ),
                  );
                }),

                // Expanded ListView takes remaining vertical space
                Expanded(
                  child: Obx(() {
                    if (controller.isLoading) {
                      return const Center(child: CircularProgressIndicator());
                    }

                    return RefreshIndicator(
                      onRefresh: () async => controller.refresh(),
                      child: ListView.builder(
                        itemCount: controller.cards.length,
                        itemBuilder: (context, index) {
                          final card = controller.cards[index];
                          return Padding(
                            padding: const EdgeInsets.only(
                              bottom: REYSizes.spaceBtwItems,
                            ),
                            child: SizedBox(
                              height: 120,
                              child: MonitoringCard(
                                icon: card['icon'],
                                value: card['value'],
                                unit: card['unit'],
                                label: card['label'],
                              ),
                            ),
                          );
                        },
                      ),
                    );
                  }),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
