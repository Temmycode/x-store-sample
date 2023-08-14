import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:sample_ecommerce/utils/colors/app_colors.dart';
import 'package:sample_ecommerce/utils/settings/dimensions/dimensions.dart';
import 'package:sample_ecommerce/utils/settings/text/titlte_text.dart';

class PromotionContainer extends StatelessWidget {
  final String image;
  const PromotionContainer({super.key, required this.image});

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return SizedBox(
      height: height * AppDimensions.height192,
      width: width * AppDimensions.width471,
      child: Stack(
        children: [
          // BACKGROUND IMAGE:
          SizedBox(
            width: double.maxFinite,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(
                height * AppDimensions.height30,
              ),
              child: CachedNetworkImage(
                imageUrl: image,
                fit: BoxFit.cover,
                placeholder: (context, url) =>
                    const Center(child: CircularProgressIndicator()),
                errorWidget: (context, url, error) => const Icon(Icons.error),
              ),
            ),
          ),
          // SHOP NOW BUTTON
          Positioned(
            left: width * AppDimensions.width21,
            bottom: height * AppDimensions.height23,
            child: GestureDetector(
              onTap: () {},
              child: Container(
                height: height * AppDimensions.height46,
                width: width * AppDimensions.width147,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(
                    height * AppDimensions.height30,
                  ),
                  color: Colors.white,
                ),
                child: Center(
                  child: TitlteText(
                    text: "Shop now!",
                    color: AppColors.orangeColor,
                    size: height * AppDimensions.height20,
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
