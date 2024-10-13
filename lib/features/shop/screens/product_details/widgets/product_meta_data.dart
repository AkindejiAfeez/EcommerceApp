import 'package:ecommerce/common/widgets/images/t_circular_image.dart';
import 'package:ecommerce/common/widgets/texts/product_price_text.dart';
import 'package:ecommerce/common/widgets/texts/product_title_text.dart';
import 'package:ecommerce/common/widgets/texts/t_brand_title_text_with_verified_icon.dart';
import 'package:ecommerce/utils/constants/enums.dart';
import 'package:ecommerce/utils/helpers/helper_function.dart';
import 'package:flutter/material.dart';

import '../../../../../common/widgets/custom_shapes/containers/rounded_containers.dart';
import '../../../../../utils/constants/colors.dart';
import '../../../../../utils/constants/image_strings.dart';
import '../../../../../utils/constants/sizes.dart';

class TProductMetaData extends StatelessWidget {
  const TProductMetaData({super.key});

  @override
  Widget build(BuildContext context) {
    final darkMode = THelperFunction.isDarkMode(context);
    return  Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ///Price & Sale Tag
        Row(
          children: [
            /// Sale Tag
        TRoundedContainer(
          radius: TSizes.sm,
          backgroundColor: TColors.secondary.withOpacity(0.8),
          padding: const EdgeInsets.symmetric(horizontal: TSizes.xs, vertical: TSizes.xs),
          child: Text('25%', style: Theme.of(context).textTheme.labelLarge!.apply(color: Colors.black)),
        ),
            const SizedBox(width: TSizes.spaceBtwItems),

            /// Price
            Text('\$250', style: Theme.of(context).textTheme.titleSmall!.apply(decoration: TextDecoration.lineThrough)),
            const SizedBox(width: TSizes.spaceBtwItems),
            const TProductPriceText(price: '175', isLarge: true),
          ],
        ),
        const SizedBox(height: TSizes.spaceBtwItems / 1.5),

        /// Title
         const TProductTitleText(title: 'Nike Air Jordan'),
        const SizedBox(height: TSizes.spaceBtwItems / 1.5),

        /// Stack Status
        Row(
          children: [
            const TProductTitleText(title: 'Status:'),
            const SizedBox(width: TSizes.spaceBtwItems),
            Text('In Stock', style: Theme.of(context).textTheme.titleMedium),
          ],
        ),

        const SizedBox(height: TSizes.spaceBtwItems / 1.5),
        
        /// Brand
        Row(
          children: [
            TCircularImage(
                image: TImages.nikeIcon,
              width: 32,
              height: 32,
              overlayColor: darkMode ? TColors.white : TColors.black,

            ),
            const TBrandTitleWithVerifiedIcon(title: 'Nike', brandTextSizes: TextSizes.medium),
          ],
        ),
      ],
    );

  }
}
