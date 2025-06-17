import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lively/features/authentication/controllers/login_controller.dart';

class LogoutDialog extends StatelessWidget {
  const LogoutDialog({super.key, required this.loginController});

  final LoginController loginController;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Logout Confirmation'),
      content: const Text('Are you sure you want to log out?'),
      actionsPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      actions: [
        Row(
          children: [
            Expanded(
              child: OutlinedButton(
                onPressed: () => Get.back(),
                child: const Text('Cancel'),
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: ElevatedButton(
                onPressed: () {
                  Get.back();
                  loginController.logout();
                },
                child: const Text('Logout'),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
