import 'package:ecommerce/features/shop/screens/all_products/all_products.dart';
import 'package:ecommerce/features/shop/screens/home/widgets/promo_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../../../../common/widgets/custom_shapes/containers/primary_header_container.dart';
import '../../../../../common/widgets/custom_shapes/containers/search_container.dart';
import '../../../../../common/widgets/layouts/grid_layout.dart';
import '../../../../../common/widgets/products/product_cards/product_card_vertical.dart';
import '../../../../../common/widgets/texts/section_heading.dart';
import '../../../../../utils/constants/image_strings.dart';
import '../../../../../utils/constants/sizes.dart';
import 'home_appbar.dart';
import 'home_categories.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return    Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            /// header
            const TPrimaryHeaderContainer(
                child: Column(
              children: [
                /// AppBar
                THomeAppBar(),
                SizedBox(height: TSizes.spaceBtwSections),

                /// searchBar
                TSearchContainer(text: 'Search in Store'),
                SizedBox(height: TSizes.spaceBtwSections),

                /// Categories
                Padding(
                  padding: EdgeInsets.only(left: TSizes.defaultSpace),
                  child: Column(
                    children: [
                      TSectionHeading(
                          title: 'Popular Categories', showActionButton: false, textColor: Colors.white),
                      SizedBox(height: TSizes.spaceBtwItems),

                      /// Categories
                      THomeCategories(),
                    ],
                  ),
                ),
                SizedBox(height: TSizes.spaceBtwSections),
              ],
            ),
            ),

            /// Body
            Padding(
              padding: const EdgeInsets.all(TSizes.defaultSpace),
              child: Column(

    children: [ const TPromoSlider(banners: [TImages.promoBanner1, TImages.promoBanner2, TImages.promoBanner3]),
      const SizedBox(height: TSizes.spaceBtwSections),

              /// Heading
            TSectionHeading(title: 'Popular Products', onPressed: () => Get.to(() => const AllProducts())),
      const SizedBox(height: TSizes.spaceBtwItems),


              /// Popular Product
                TGridLayout(itemCount: 4, itemBuilder: (_, index) => const TProductCardVertical()),
              ]
            )
            )
          ],
        ),
      ),
    );
  }
}



