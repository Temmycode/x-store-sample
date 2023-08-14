import 'package:flutter/material.dart';
import 'package:sample_ecommerce/utils/constants/images/app_images.dart';
import 'package:sample_ecommerce/utils/settings/dimensions/dimensions.dart';
import 'package:sample_ecommerce/utils/settings/text/titlte_text.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return SliverAppBar(
      backgroundColor: Colors.white,
      toolbarHeight: height * AppDimensions.height52,
      elevation: 0.0,
      floating: true,
      pinned: false,
      snap: false,
      titleSpacing: width * AppDimensions.width35,
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // APP NAME
          Row(
            children: [
              ClipRRect(
                borderRadius:
                    BorderRadius.circular(height * AppDimensions.height33),
                child: Image.asset(
                  AppImages.appIcon,
                  height: height * AppDimensions.height49,
                ),
              ),
              SizedBox(width: width * AppDimensions.width19),
              const TitlteText(text: "X-Store"),
            ],
          ),
          // ACTION BUTTONS
          Row(
            children: [
              GestureDetector(
                onTap: () {},
                child: ImageIcon(
                  const AssetImage(AppImages.searchIcon),
                  size: height * AppDimensions.height33,
                  color: Colors.black,
                ),
              ),
              SizedBox(width: width * AppDimensions.width31),
              GestureDetector(
                onTap: () {},
                child: ImageIcon(
                  const AssetImage(AppImages.notificationIcon),
                  size: height * AppDimensions.height36,
                  color: Colors.black,
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
