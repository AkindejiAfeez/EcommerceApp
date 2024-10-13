import 'package:ecommerce/common/widgets/appbar/appbar.dart';
import 'package:ecommerce/features/shop/screens/product_reviews/widgets/rating_progress_indicator.dart';
import 'package:ecommerce/features/shop/screens/product_reviews/widgets/user_review_card.dart';
import 'package:ecommerce/utils/constants/sizes.dart';
import 'package:flutter/material.dart';

import '../../../../../common/widgets/products/ratings/rating_indicator.dart';

class ProductReviewScreen extends StatelessWidget {
  const ProductReviewScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      /// Appbar
      appBar: TAppBar(title: Text('Reviews & Rating'), showBackArrow: true),


      /// Body
      body: SingleChildScrollView(
        child: Padding(
            padding: EdgeInsets.all(TSizes.defaultSpace),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Ratings and reviews are verified and are  from people who use same type of device that you use.'),
            SizedBox(height: TSizes.spaceBtwItems),

            /// OverallProduct Rating
            TOverallProductRating(),
            TRatingBarIndicator(rating: 3.5),
            Text('12,000', style: Theme.of(context).textTheme.bodySmall),
            const SizedBox(height: TSizes.spaceBtwSections),


            /// User Reviews List
            UserReviewCard(),
            UserReviewCard(),
            UserReviewCard(),
          ],
        ),),
      ),
    );
  }
}






