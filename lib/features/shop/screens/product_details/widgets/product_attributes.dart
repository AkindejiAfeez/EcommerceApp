import 'package:ecommerce/common/widgets/section_heading.dart';
import 'package:ecommerce/common/widgets/texts/product_price_text.dart';
import 'package:ecommerce/common/widgets/texts/product_title_text.dart';
import 'package:flutter/material.dart';

import '../../../../../common/widgets/chips/choice_chips.dart';
import '../../../../../common/widgets/custom_shapes/containers/rounded_containers.dart';
import '../../../../../utils/constants/colors.dart';
import '../../../../../utils/constants/sizes.dart';
import '../../../../../utils/helpers/helper_function.dart';

class TProductAttributes extends StatelessWidget {
  const TProductAttributes({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunction.isDarkMode(context);
    return Column(
      children: [
        /// Selected Att Pricing
        TRoundedContainer(
          padding: const EdgeInsets.all(TSizes.md),
          backgroundColor: dark ? TColors.darkGrey : TColors.grey ,
          child:  Column(
            children: [
              /// Title, price & stock status
              Row(
                children: [
                  TSectionHeading(title: 'Variation', showActionButton: false),
                  SizedBox(width: TSizes.spaceBtwItems),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                      const TProductTitleText(title: 'Price :', smallSize: true),
                      const SizedBox(width: TSizes.spaceBtwItems),

            /// Actual Price
            Text('\$25',
              style: Theme.of(context).textTheme.titleSmall!.apply(decoration: TextDecoration.lineThrough),
            ),
            const SizedBox(width: TSizes.spaceBtwItems),

            /// Sale Price
           const TProductPriceText(price: '20'),

          ],
        ),
                      /// Stock
                      Row(
                        children: [
                          const TProductTitleText(title: 'Stock :', smallSize: true),
                          Text('In Stock', style: Theme.of(context).textTheme.titleMedium),
                        ],
                      )
                    ],
                  )

                ],
              ),
              /// Variation Description
              const TProductTitleText(
                  title: 'This is the Description of the Product and it can go up to max 4 lines.',
              smallSize: true,
              maxLines: 4,
              ),
            ],
          ),
        ),
        const SizedBox(height: TSizes.spaceBtwItems),

        /// Attributes
        Column(
            crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TSectionHeading(title: 'Colors', showActionButton: false),
            const SizedBox(height: TSizes.spaceBtwItems / 2),
            Wrap(
              spacing: 8,
              children: [
                TChoiceChip(text: 'Green', selected: true, onSelected: (value){}),
                TChoiceChip(text: 'Blue', selected: false, onSelected: (value){}),
                TChoiceChip(text: 'Brown', selected: false, onSelected: (value){}),
                TChoiceChip(text: 'Green', selected: true, onSelected: (value){}),
                TChoiceChip(text: 'Blue', selected: false, onSelected: (value){}),
                TChoiceChip(text: 'Brown', selected: false, onSelected: (value){}),

              ],
            )


          ],
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TSectionHeading(title: 'Size', showActionButton: false),
            const SizedBox(height: TSizes.spaceBtwItems / 2),
            Wrap(
              spacing: 8,
              children: [
                TChoiceChip(text: 'EU 34', selected: true, onSelected: (value){}),
                TChoiceChip(text: 'EU 35', selected: false, onSelected: (value){}),
                TChoiceChip(text: 'EU 36', selected: false, onSelected: (value){}),
                TChoiceChip(text: 'EU 34', selected: true, onSelected: (value){}),
                TChoiceChip(text: 'EU 35', selected: false, onSelected: (value){}),
                TChoiceChip(text: 'EU 36', selected: false, onSelected: (value){}),
              ],
            )

          ],
        )
      ],
    );
  }
}

