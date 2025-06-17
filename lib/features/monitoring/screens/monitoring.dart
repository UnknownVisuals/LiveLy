import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:lively/features/authentication/controllers/login_controller.dart';
import 'package:lively/features/monitoring/controllers/monitoring_controller.dart';
import 'package:lively/features/monitoring/screens/widgets/logout_dialog.dart';
import 'package:lively/features/monitoring/screens/widgets/monitoring_card.dart';
import 'package:lively/utils/constants/colors.dart';
import 'package:lively/utils/constants/image_string.dart';
import 'package:lively/utils/constants/sizes.dart';
import 'package:lively/utils/constants/text_string.dart';

class MonitoringScreen extends StatelessWidget {
  const MonitoringScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final monitoringController = Get.put(MonitoringController());
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
              Get.dialog(LogoutDialog(loginController: loginController));
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

                // Cards Section
                Expanded(
                  child: Obx(() {
                    if (monitoringController.isLoading.value) {
                      return const Center(
                        child: CircularProgressIndicator(
                          valueColor: AlwaysStoppedAnimation(REYColors.primary),
                        ),
                      );
                    }

                    return RefreshIndicator(
                      color: REYColors.primary,
                      onRefresh: () async => monitoringController.refreshData(),
                      child: ListView.builder(
                        itemCount: monitoringController.cards.length,
                        itemBuilder: (context, index) {
                          final card = monitoringController.cards[index];
                          return Padding(
                            padding: const EdgeInsets.only(
                              bottom: REYSizes.spaceBtwItems,
                            ),
                            child: SizedBox(
                              height: 150,
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
