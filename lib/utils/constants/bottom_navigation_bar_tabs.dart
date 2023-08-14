import 'package:flutter/material.dart';
import 'package:sample_ecommerce/utils/constants/images/app_images.dart';

class TabItem {
  UniqueKey? id = UniqueKey();
  final String name;
  TabItem({required this.name});

  static List<TabItem> tabItemList = [
    TabItem(name: AppImages.homeActiveIcon),
    TabItem(name: AppImages.compassActiveIcon),
    TabItem(name: AppImages.likeIcon),
    TabItem(name: AppImages.shoppingCartActiveIcon),
    TabItem(name: AppImages.personActiveIcon),
  ];
  static List<TabItem> inActiveList = [
    TabItem(name: AppImages.homeIcon),
    TabItem(name: AppImages.compassIcon),
    TabItem(name: AppImages.unlikeIcon),
    TabItem(name: AppImages.shoppingCartIcon),
    TabItem(name: AppImages.personIcon),
  ];
}
