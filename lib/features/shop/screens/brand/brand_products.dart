import 'package:ecommerce/common/widgets/brands/brand_card.dart';
import 'package:flutter/material.dart';

import '../../../../common/widgets/appbar/appbar.dart';
import '../../../../common/widgets/products/sortable/sortable_products.dart';
import '../../../../utils/constants/sizes.dart';

class BrandProducts extends StatelessWidget {
  const BrandProducts({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TAppBar(title: Text('Nike')),
        body: SingleChildScrollView(
        child: Padding(
        padding: EdgeInsets.all(TSizes.defaultSpace),
    child: Column(
    children: [
      /// Brand Details
    TBrandCard(showBorder: true),
    SizedBox(height: TSizes.spaceBtwSections),

    TSortableProducts(),
    ],
    ),
    ),
        ),
    );
  }
}
