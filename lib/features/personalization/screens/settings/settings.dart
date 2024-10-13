import 'package:ecommerce/common/widgets/appbar/appbar.dart';
import 'package:ecommerce/common/widgets/custom_shapes/containers/primary_header_container.dart';
import 'package:ecommerce/common/widgets/list_tiles/settings_menu_tile.dart';
import 'package:ecommerce/common/widgets/section_heading.dart';
import 'package:ecommerce/features/authentication/screens/login/login.dart';
import 'package:ecommerce/features/personalization/screens/address/address.dart';
import 'package:ecommerce/features/shop/screens/order/order.dart';
import 'package:ecommerce/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../common/widgets/list_tiles/user_profile_tile.dart';
import '../../../../utils/constants/colors.dart';
import '../profile/profile.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            /// Header
            TPrimaryHeaderContainer(
                child: Column(
              children: [TAppBar(title: Text('Account', style: Theme.of(context).textTheme.headlineMedium!.apply(color: TColors.white))),
                const SizedBox(height: TSizes.spaceBtwSections),

                /// User Profile Card
                TUserProfileTitle(onPressed: () => Get.to(() => const ProfileScreen())),
                const SizedBox(height: TSizes.spaceBtwSections),
              ],
            ),
            ),

            /// Body
              Padding(
                padding: const EdgeInsets.all(TSizes.defaultSpace),
            child: Column(
              children: [
                /// Account Settings
                const TSectionHeading(title: 'Account Settings', showActionButton: false),
                const SizedBox(height: TSizes.spaceBtwItems),

                TSettingsMenuTile(icon: Icons.add_home_outlined,
                  title: 'My Addresses',
                  subTitle: 'Set shopping delivery address',
                onTap: () => Get.to(() => const UserAddressScreen()),
                ),
                const TSettingsMenuTile(icon: Icons.shopping_cart, title: 'My Cart', subTitle: 'Add, remove product and move to checkout'),
                TSettingsMenuTile(icon: Icons.shopping_bag, title: 'My Orders', subTitle: 'In-progress and Completed Orders',
                  onTap: () => Get.to(() => const OrderScreen()),),
                const TSettingsMenuTile(icon: Icons.account_balance, title: 'Bank Account', subTitle: 'Withdraw balance to registered bank account'),
                const TSettingsMenuTile(icon: Icons.discount, title: 'My Coupons', subTitle: 'List of all the discounted coupons'),
                const TSettingsMenuTile(icon: Icons.notifications, title: 'Notification', subTitle: 'Set any kind of notification message'),
                const TSettingsMenuTile(icon: Icons.privacy_tip, title: 'Account Privacy', subTitle: 'Manage data usage and connected accounts'),

                /// App Settings
                const SizedBox(height: TSizes.spaceBtwSections),
                const TSectionHeading(title: 'App Settings', showActionButton: false),
                const SizedBox(height: TSizes.spaceBtwItems),
                const TSettingsMenuTile(icon: Icons.upload_file, title: 'Load Data', subTitle: 'Upload Data to your Cloud Firebase'),
                TSettingsMenuTile(icon: Icons.location_on_outlined, title: 'Geolocation', subTitle: 'Get recommendation based on location',
                trailing: Switch(value: true, onChanged: (value) {} ),
                ),
                TSettingsMenuTile(icon: Icons.privacy_tip, title: 'Safe Mode', subTitle: 'Search result is safe for all ages',
                  trailing: Switch(value: false, onChanged: (value) {} ),
                ),
                TSettingsMenuTile(icon: Icons.hd, title: 'HD Image Quality', subTitle: 'Set image quality to be seen',
                  trailing: Switch(value: false, onChanged: (value) {} ),
                ),

                /// Logout Button
                const SizedBox(height: TSizes.spaceBtwSections),
                SizedBox(
                  width: double.infinity,
                  child: OutlinedButton(onPressed: () => Get.to(() => const LoginScreen()), child: const Text('Logout')),
                ),
                const SizedBox(height: TSizes.spaceBtwSections),


              ],
            ))
          ],
        ),
      )
    );
  }
}

