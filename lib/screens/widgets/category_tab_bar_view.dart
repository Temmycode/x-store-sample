import 'package:flutter/material.dart';
import 'package:sample_ecommerce/mock/constants/item_category_mock.dart';
import 'package:sample_ecommerce/screens/widgets/product_container.dart';
import 'package:sample_ecommerce/utils/settings/dimensions/dimensions.dart';

class CategoryTabView extends StatelessWidget {
  final String category;
  const CategoryTabView({super.key, required this.category});

  @override
  Widget build(BuildContext context) {
    // final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    // a provider will call the data that has been gotten from the repositories to be displayed in the grid view
    // the data will be sorted section by section
    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      padding: EdgeInsets.only(
        left: width * AppDimensions.width27,
        right: width * AppDimensions.width27,
        bottom: width * AppDimensions.height20,
      ),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        childAspectRatio: 0.62,
        crossAxisCount: 2,
      ),
      itemCount:
          // this is for mock data alone : providers will handle the data form APIs
          (category == 'All')
              ? allMock.length
              : (category == 'Newest')
                  ? newestMock.length
                  : (category == 'Popular')
                      ? popularMock.length
                      : (category == 'Man')
                          ? manCategoryMock.length
                          : (category == 'Woman')
                              ? womanCategoryMock.length
                              : null,
      itemBuilder: (context, index) {
        return ProductContainer(
          productName: (category == 'All')
              ? allMock[index][1]
              : (category == 'Newest')
                  ? newestMock[index][1]
                  : (category == 'Popular')
                      ? popularMock[index][1]
                      : (category == 'Man')
                          ? manCategoryMock[index][1]
                          : (category == 'Woman')
                              ? womanCategoryMock[index][1]
                              : null,
          productPrice: (category == 'All')
              ? allMock[index][2]
              : (category == 'Newest')
                  ? newestMock[index][2]
                  : (category == 'Popular')
                      ? popularMock[index][2]
                      : (category == 'Man')
                          ? manCategoryMock[index][2]
                          : (category == 'Woman')
                              ? womanCategoryMock[index][2]
                              : null,
          productImage: (category == 'All')
              ? allMock[index][0]
              : (category == 'Newest')
                  ? newestMock[index][0]
                  : (category == 'Popular')
                      ? popularMock[index][0]
                      : (category == 'Man')
                          ? manCategoryMock[index][0]
                          : (category == 'Woman')
                              ? womanCategoryMock[index][0]
                              : null,
        );
      },
    );
  }
}
