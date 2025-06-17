import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:intl/intl.dart';
import 'package:lively/features/authentication/controllers/signup_controller.dart';
import 'package:lively/features/authentication/screens/signup/widgets/term_and_conditions.dart';
import 'package:lively/utils/constants/sizes.dart';
import 'package:lively/utils/constants/text_string.dart';
import 'package:lively/utils/validators/validation.dart';

class SignupForm extends StatelessWidget {
  const SignupForm({super.key});

  @override
  Widget build(BuildContext context) {
    final SignupController signupController = Get.put(SignupController());
    final formKey = GlobalKey<FormState>();

    return Form(
      key: formKey,
      child: Column(
        children: [
          // First Name & Last Name
          Row(
            children: [
              Expanded(
                child: TextFormField(
                  controller: signupController.firstNameController,
                  decoration: const InputDecoration(
                    labelText: REYTexts.firstName,
                    prefixIcon: Icon(Iconsax.user),
                  ),
                ),
              ),
              const SizedBox(width: REYSizes.spaceBtwInputFields),
              Expanded(
                child: TextFormField(
                  controller: signupController.lastNameController,
                  decoration: const InputDecoration(
                    labelText: REYTexts.lastName,
                    prefixIcon: Icon(Iconsax.user),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: REYSizes.spaceBtwInputFields),

          // Username
          TextFormField(
            controller: signupController.usernameController,
            decoration: const InputDecoration(
              labelText: REYTexts.username,
              prefixIcon: Icon(Iconsax.user_edit),
            ),
          ),
          const SizedBox(height: REYSizes.spaceBtwInputFields),

          // Gender Dropdown
          Obx(
            () => DropdownButtonFormField<String>(
              value:
                  signupController.selectedGender.value.isEmpty
                      ? null
                      : signupController.selectedGender.value,
              items: const [
                DropdownMenuItem(value: 'Male', child: Text('Male')),
                DropdownMenuItem(value: 'Female', child: Text('Female')),
              ],
              onChanged: signupController.setGender,
              decoration: const InputDecoration(
                labelText: REYTexts.gender,
                prefixIcon: Icon(Iconsax.user_tag),
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please select your gender.';
                }
                return null;
              },
            ),
          ),
          const SizedBox(height: REYSizes.spaceBtwInputFields),

          // Birthdate with Calendar Picker
          Obx(
            () => TextFormField(
              readOnly: true,
              onTap: signupController.pickBirthDate,
              controller: TextEditingController(
                text:
                    signupController.selectedBirthDate.value != null
                        ? DateFormat(
                          'yyyy-MM-dd',
                        ).format(signupController.selectedBirthDate.value!)
                        : '',
              ),
              decoration: const InputDecoration(
                labelText: REYTexts.birthDate,
                prefixIcon: Icon(Iconsax.calendar_1),
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please select your birthdate.';
                }
                return null;
              },
            ),
          ),
          const SizedBox(height: REYSizes.spaceBtwInputFields),

          // Email
          TextFormField(
            controller: signupController.emailController,
            validator: REYValidator.validateEmail,
            decoration: const InputDecoration(
              labelText: REYTexts.email,
              prefixIcon: Icon(Iconsax.direct),
            ),
          ),
          const SizedBox(height: REYSizes.spaceBtwInputFields),

          // Password
          Obx(
            () => TextFormField(
              controller: signupController.passwordController,
              obscureText: signupController.obscurePassword.value,
              validator: REYValidator.validatePassword,
              decoration: InputDecoration(
                labelText: REYTexts.password,
                prefixIcon: const Icon(Iconsax.password_check),
                suffixIcon: IconButton(
                  icon: Icon(
                    signupController.obscurePassword.value
                        ? Iconsax.eye_slash
                        : Iconsax.eye,
                  ),
                  onPressed: signupController.togglePasswordVisibility,
                ),
              ),
            ),
          ),
          const SizedBox(height: REYSizes.spaceBtwSections),

          // Agree to Terms & Conditions
          const TermAndConditions(),
          const SizedBox(height: REYSizes.spaceBtwSections),

          // Signup Button
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () async {
                if (formKey.currentState!.validate()) {
                  await signupController.signup();
                }
              },
              child: const Text(REYTexts.createAccount),
            ),
          ),
        ],
      ),
    );
  }
}
