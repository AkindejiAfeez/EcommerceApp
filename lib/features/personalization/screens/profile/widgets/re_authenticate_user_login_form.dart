import 'package:ecommerce/features/personalization/controllers/user_controller.dart';
import 'package:ecommerce/utils/validators/validation.dart';
import 'package:flutter/material.dart';

import '../../../../../utils/constants/sizes.dart';

class ReAuthLoginForm extends StatelessWidget {
  const ReAuthLoginForm({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = UserController.instance;
    return Scaffold(
      appBar: AppBar(title: const Text('Re-Authenticate User')),
      body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(TSizes.defaultSpace),
            child: Form(
             // key: controller.reAuthFormKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  /// Email
                  TextFormField(
                    //controller: controller.verifyEmail,
                    validator: TValidator.validateEmail,
                  )
                ],
              ),
            ),
          )
      )
    );
  }
}
