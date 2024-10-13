import 'package:ecommerce/common/styles/spacing_style.dart';
import 'package:ecommerce/features/authentication/screens/login/widgets/login_form.dart';
import 'package:ecommerce/features/authentication/screens/login/widgets/login_header.dart';
import 'package:ecommerce/utils/helpers/helper_function.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../common/widgets/login_signup/form_divider.dart';
import '../../../../common/widgets/login_signup/social_buttons.dart';

import '../../../../utils/constants/sizes.dart';
import '../../../../utils/constants/text_strings.dart';


class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunction.isDarkMode(context);

    return Scaffold(
        body: SingleChildScrollView(
          child: Padding(
            padding: TSpacingStyle.paddingWithAppBarHeight,
            child: Column(
              children: [
            /// Logo, Title  & Sub-Title
            TLoginHeader(),

          /// Form
          const TLoginForm(),
                
                /// Divider
                TFormDivider(dividerText: TTexts.orSignInWith.capitalize!,),
                const SizedBox(width: TSizes.spaceBtwSections),

                /// Footer
                const TSocialButtons(),
              ],
    ),
    ),
    ),
    );
    }
}








