import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sample_ecommerce/provider/like_product_provider.dart';
import 'package:sample_ecommerce/utils/colors/app_colors.dart';
import 'package:sample_ecommerce/utils/constants/images/app_images.dart';
import 'package:sample_ecommerce/utils/settings/dimensions/dimensions.dart';
import 'package:sample_ecommerce/utils/settings/text/titlte_text.dart';

class ProductContainer extends ConsumerStatefulWidget {
  final String productImage;
  final String productName;
  final double productPrice;
  const ProductContainer({
    super.key,
    required this.productName,
    required this.productPrice,
    required this.productImage,
  });

  @override
  ConsumerState<ProductContainer> createState() => _ProductContainerState();
}

class _ProductContainerState extends ConsumerState<ProductContainer> {
  @override
  Widget build(BuildContext context) {
    final likedProducts = ref.watch(likeProductProvider);
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return SizedBox(
      height: height * AppDimensions.height398,
      width: width * AppDimensions.width226,
      child: Column(
        children: [
          // IMAGE CONTAINER:
          Stack(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(
                  height * AppDimensions.height20,
                ),
                child: CachedNetworkImage(
                  imageUrl: widget.productImage,
                  fit: BoxFit.cover,
                  placeholder: (context, url) =>
                      const Center(child: CircularProgressIndicator()),
                  errorWidget: (context, url, error) => const Icon(Icons.error),
                  height: height * AppDimensions.height290,
                  width: width * AppDimensions.width226,
                ),
              ),
              Positioned(
                top: height * AppDimensions.height14,
                right: width * AppDimensions.width14,
                child: GestureDetector(
                  onTap: () {
                    ref
                        .read(likeProductProvider.notifier)
                        .likeProduct(widget.productName);
                  },
                  child: Container(
                    padding: EdgeInsets.all(height * AppDimensions.height12),
                    height: height * AppDimensions.height47,
                    width: height * AppDimensions.height47,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(
                        height * AppDimensions.height36,
                      ),
                      color: likedProducts.contains(widget.productName)
                          ? AppColors.orangeColor
                          : Colors.white,
                    ),
                    child: ImageIcon(
                      AssetImage(
                        likedProducts.contains(widget.productName)
                            ? AppImages.likeIcon
                            : AppImages.unlikeIcon,
                      ),
                      size: height * AppDimensions.height20,
                      color: likedProducts.contains(widget.productName)
                          ? Colors.white
                          : AppColors.orangeColor,
                    ),
                  ),
                ),
              )
            ],
          ),
          // PRODUCT NAME
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: height * AppDimensions.height23),
              TitlteText(
                text: widget.productName,
                size: height * AppDimensions.height20,
                weight: FontWeight.w500,
              ),
              SizedBox(height: height * AppDimensions.height5),
              // PRODUCT PRICE
              TitlteText(
                text: "\$${widget.productPrice.toStringAsFixed(2)}",
                size: height * AppDimensions.height23,
              ),
              // SizedBox(height: height * AppDimensions.height26,)
            ],
          ),
        ],
      ),
    );
  }
}
