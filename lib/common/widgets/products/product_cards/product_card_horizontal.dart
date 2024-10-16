import 'package:ecommerce/common/widgets/custom_shapes/containers/rounded_containers.dart';
import 'package:ecommerce/common/widgets/images/t_rounded_image.dart';
import 'package:ecommerce/common/widgets/texts/product_price_text.dart';
import 'package:ecommerce/common/widgets/texts/product_title_text.dart';
import 'package:ecommerce/common/widgets/texts/t_brand_title_text_with_verified_icon.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../utils/constants/colors.dart';
import '../../../../utils/constants/image_strings.dart';
import '../../../../utils/constants/sizes.dart';
import '../../../../utils/helpers/helper_function.dart';
import '../../../styles/shadows.dart';
import '../../icons/t_circular_icon.dart';

class TProductCardHorizontal extends StatelessWidget {
  const TProductCardHorizontal({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunction.isDarkMode(context);

    return  Container(
        width: 310,
        padding: const EdgeInsets.all(1),
    decoration: BoxDecoration(
    borderRadius: BorderRadius.circular(TSizes.productImageRadius),
    color: dark ? TColors.darkerGrey : TColors.softGrey,
    ),
      child: Row(
        children: [
          /// Thumbnail
          TRoundedContainer(
            height: 120,
            padding: const EdgeInsets.all(TSizes.sm),
            backgroundColor: dark ? TColors.dark : TColors.light,
            child: Stack(
              children: [
                /// Thumbnail Image
                SizedBox(
                  height: 120,
                    width: 120,
                    child: TRoundedImage(imageUrl: TImages.productImage16, applyImageRadius: true)),

                /// Sale Tag
                Positioned(
                  top: 12,
                  child: TRoundedContainer(
                    radius: TSizes.sm,
                    backgroundColor: TColors.secondary.withOpacity(0.8),
                    padding: const EdgeInsets.symmetric(horizontal: TSizes.xs, vertical: TSizes.xs),
                    child: Text('25%', style: Theme.of(context).textTheme.labelLarge!.apply(color: Colors.black)),
                  ),
                ),

                /// Favorite Icon Button
                const Positioned(
                    top: 0,
                    right: 0,
                    child: TCircularIcon(icon: Icons.favorite, color: Colors.red,))
              ],
            ),
          ),
          
          /// Details
          SizedBox(
            width: 172,
            child: Padding(
              padding: const EdgeInsets.only(top: TSizes.sm, left: TSizes.sm),
              child:  Column(
                children: [
                  const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TProductTitleText(title: 'YHMEI Wristwatch', smallSize: true),
                      SizedBox(height: TSizes.spaceBtwItems / 2),
                      TBrandTitleWithVerifiedIcon(title: 'YHMEI'),
                    ],
                  ),

                  const Spacer(),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      /// Pricing
                      Flexible(child: const TProductPriceText(price: '100.0')),

                      /// Add to cart
                      Container(
                        decoration: const BoxDecoration(
                          color: TColors.dark,
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(TSizes.cardRadiusMd),
                            bottomRight: Radius.circular(TSizes.productImageRadius),
                          ),
                        ),
                        child: const SizedBox(
                            width: TSizes.iconLg * 1.2,
                            height: TSizes.iconLg *1.2,
                            child: Center(child: Icon(Icons.add, color: TColors.white))),
                      ),

                    ],
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
