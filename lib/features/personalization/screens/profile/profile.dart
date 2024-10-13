import 'package:ecommerce/common/widgets/appbar/appbar.dart';
import 'package:ecommerce/common/widgets/images/t_circular_image.dart';
import 'package:ecommerce/common/widgets/section_heading.dart';
import 'package:ecommerce/features/personalization/screens/profile/widgets/profile_menu.dart';
import 'package:flutter/material.dart';

import '../../../../utils/constants/image_strings.dart';
import '../../../../utils/constants/sizes.dart';
import '../../controllers/user_controller.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: const TAppBar(showBackArrow: true, title: Text('Profile'),
      ),
      /// Body
      body: SingleChildScrollView(
        child: Padding(
            padding: const EdgeInsets.all(TSizes.defaultSpace),
        child: Column(
          children: [
            /// Profile Picture
            SizedBox(
              width: double.infinity,
              child: Column(
                children: [
                  const TCircularImage(image: TImages.user, width: 80, height: 80),
                  TextButton(onPressed: (){}, child: const Text('Change Profile Picture')),
                ],
              ),
            ),

            /// Details
            const SizedBox(height: TSizes.spaceBtwItems / 2),
            const Divider(),
            const SizedBox(height: TSizes.spaceBtwItems),
            const TSectionHeading(title: 'Profile Information', showActionButton: false),
            const SizedBox(height: TSizes.spaceBtwItems),

            TProfileMenu(onPressed: () {}, title: 'Name', value: 'Afeez Akindeji'),
            TProfileMenu(onPressed: () {}, title: 'Username', value: 'Afeez'),

            const SizedBox(height: TSizes.spaceBtwItems),
            const Divider(),
            const SizedBox(height: TSizes.spaceBtwItems),

            /// Heading Personal Info
            const TSectionHeading(title: 'Personal Information', showActionButton: false),
            const SizedBox(height: TSizes.spaceBtwItems),

            TProfileMenu(onPressed: () {}, title: 'User ID', value: '32002399', icon: Icons.copy,),
            TProfileMenu(onPressed: () {}, title: 'E-mail', value: 'aakindeji@baucyprus.edu.tr'),
            TProfileMenu(onPressed: () {}, title: 'Phone Number', value: '+234-810-2667505'),
            TProfileMenu(onPressed: () {}, title: 'Gender', value: 'Male'),
            TProfileMenu(onPressed: () {}, title: 'Date of Birth', value: '18 Feb, 1997'),
            const Divider(),
            const SizedBox(height: TSizes.spaceBtwItems),
            
            Center(
              child: TextButton(
                onPressed: () {},
                child: const Text('Close Account', style: TextStyle(color: Colors.red)),
              ),
            )



          ],
        )
        ),
      ),
    );
  }
}

