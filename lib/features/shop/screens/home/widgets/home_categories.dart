import 'package:ecommerce/features/shop/screens/sub_category/sub_categories.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../../common/widgets/image_text_widgets/vertical_image_text.dart';
import '../../../../../utils/constants/image_strings.dart';

class THomeCategories extends StatelessWidget {
  const THomeCategories({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 80,
      child: ListView.builder(
          shrinkWrap: true,
          itemCount: 6,
          scrollDirection: Axis.horizontal,
          itemBuilder: (_, index) {
            switch (index) {
              case 0:
                return  TVerticalImageText(image: TImages.glassesIcon, title: 'Glasses', onTap: () => Get.to(() => const SubCategoriesScreen()));
              case 1:
                return  TVerticalImageText(image: TImages.bagIcon, title: 'Bag', onTap: () => Get.to(() => const SubCategoriesScreen()));
              case 2:
                return  TVerticalImageText(image: TImages.capIcon, title: 'Cap', onTap: () => Get.to(() => const SubCategoriesScreen()));
              case 3:
                return  TVerticalImageText(image: TImages.wristwatchesIcon, title: 'watches', onTap: () => Get.to(() => const SubCategoriesScreen()));
              case 4:
                return  TVerticalImageText(image: TImages.jewelryIcon, title: 'Jewelry', onTap: () => Get.to(() => const SubCategoriesScreen()));
              default:
                return Container(); // handle any extra cases if needed
            }
          }),
    );
  }
}
