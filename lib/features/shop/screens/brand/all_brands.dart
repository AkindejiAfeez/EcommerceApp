import 'package:ecommerce/common/widgets/brands/brand_card.dart';
import 'package:ecommerce/common/widgets/layouts/grid_layout.dart';
import 'package:ecommerce/common/widgets/section_heading.dart';
import 'package:ecommerce/features/shop/screens/brand/brand_products.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../../../common/widgets/appbar/appbar.dart';
import '../../../../utils/constants/sizes.dart';

class AllBrandsScreen extends StatelessWidget {
  const AllBrandsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: TAppBar(title: Text('Brands'), showBackArrow: true),
        body: SingleChildScrollView(
        child: Padding(
        padding: const EdgeInsets.all(TSizes.defaultSpace),
    child: Column(
    children: [
      /// Heading
    TSectionHeading(title: 'Brands', showActionButton: false,),
    SizedBox(height: TSizes.spaceBtwItems),

    /// Brands
    TGridLayout(
      itemCount: 10,
      mainAxisExtent: 80,
      itemBuilder: (context, index) => TBrandCard(showBorder: true, onTap: () => Get.to(() => const BrandProducts()),),
    ),
    ],
    ),
    ),
        )
    );
  }
}
