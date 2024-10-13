import 'package:ecommerce/features/authentication/controllers/signup/signup_controller.dart';
import 'package:ecommerce/features/authentication/screens/signup/widgets/terms_condition_checkbox.dart';
import 'package:ecommerce/utils/validators/validation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../utils/constants/sizes.dart';
import '../../../../../utils/constants/text_strings.dart';

class TSignupForm extends StatelessWidget {
  const TSignupForm({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(SignupController());
    return  Form(
      key: controller.signupFormKey,
      child:  Column(
        children: [
          /// First & Last Name
          Row(
            children: [
              Expanded(
                child: TextFormField(
                  controller: controller.firstName,
                  validator: (value) =>TValidator.validateEmptyText('First name', value),
                  expands: false,
                  decoration: const InputDecoration(
                      labelText: TTexts.firstName,
                      prefixIcon: Icon(Icons.person)),
                ),
              ),
              const SizedBox(width: TSizes.spaceBtwInputFields),
              Expanded(
                child: TextFormField(
                  controller: controller.lastName,
                  validator: (value) =>TValidator.validateEmptyText('Last name', value),
                  expands: false,
                  decoration: const InputDecoration(
                      labelText: TTexts.lastNAme,
                      prefixIcon: Icon(Icons.person)),
                ),
              ),
            ],
          ),
          const SizedBox(height: TSizes.spaceBtwInputFields),

          /// Username
          TextFormField(
            validator: (value) =>TValidator.validateEmptyText('Username', value),
            controller: controller.username,
            expands: false,
            decoration: const InputDecoration(
                labelText: TTexts.username,
                prefixIcon: Icon(Icons.person_add_alt_1)),
          ),
          const SizedBox(height: TSizes.spaceBtwInputFields),

          /// Email
          TextFormField(
            validator: (value) =>TValidator.validateEmail(value),
            controller: controller.email,
            decoration: const InputDecoration(
                labelText: TTexts.email, prefixIcon: Icon(Icons.email)),
          ),

          const SizedBox(height: TSizes.spaceBtwInputFields),

          /// Phone Number
          TextFormField(
            validator: (value) =>TValidator.validatePhoneNumber(value),
            controller: controller.phoneNumber,
            decoration: const InputDecoration(
                labelText: TTexts.phoneNo, prefixIcon: Icon(Icons.call)),
          ),

          const SizedBox(height: TSizes.spaceBtwInputFields),
/// Password
          Obx(
            () => TextFormField(
              validator: (value) =>TValidator.validatePassword(value),
              controller: controller.password,
              obscureText: controller.hidePassword.value,
              decoration:  InputDecoration(
                prefixIcon: const Icon(Icons.password),
                labelText: TTexts.password,
                suffixIcon:  IconButton(
                  onPressed: () => controller.hidePassword.value = !controller.hidePassword.value,
                  icon:  Icon(controller.hidePassword.value ? Icons.remove_red_eye  :Icons.remove_red_eye_outlined),
              ),
            ),
            ),
          ),
          const SizedBox(height: TSizes.spaceBtwSections),

          /// Terms&Condition
          const TTermsAndConditionCheckbox(),
          const SizedBox(height: TSizes.spaceBtwSections),

          /// signup Button
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
                onPressed: () => controller.signup(),
                child: const Text(TTexts.createAccount)),
          ),
        ],
      ),
    );
  }
}


