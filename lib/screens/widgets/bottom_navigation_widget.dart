import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sample_ecommerce/provider/bottom_navigation_provider.dart';
import 'package:sample_ecommerce/utils/colors/app_colors.dart';
import 'package:sample_ecommerce/utils/constants/bottom_navigation_bar_tabs.dart';
import 'package:sample_ecommerce/utils/settings/dimensions/dimensions.dart';

// TODO: DEAL WITH THE COLOR OF THE TABBAR:
class BottomNavigationWidget extends ConsumerStatefulWidget {
  const BottomNavigationWidget({super.key});

  @override
  ConsumerState<BottomNavigationWidget> createState() =>
      _BottomNavigationWidgetState();
}

class _BottomNavigationWidgetState
    extends ConsumerState<BottomNavigationWidget> {
  final List<TabItem> _icons = TabItem.tabItemList;
  final List<TabItem> _inactiveIcons = TabItem.inActiveList;
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final currentIndex = ref.watch(bottomNavigationProvider);
    return SafeArea(
      child: ClipRRect(
        borderRadius: BorderRadius.circular(height * AppDimensions.height106),
        child: Container(
          height: height * AppDimensions.height92,
          color: Colors.transparent,
          child: Stack(
            children: [
              BackdropFilter(
                filter: ImageFilter.blur(
                  sigmaX: 4.0,
                  sigmaY: 4.0,
                ),
                child: Container(),
              ),
              Container(
                decoration: BoxDecoration(
                  borderRadius:
                      BorderRadius.circular(height * AppDimensions.height46),
                  border: Border.all(
                    color: Colors.white.withOpacity(0.13),
                  ),
                  gradient: LinearGradient(
                    colors: [
                      Colors.black.withOpacity(0.70),
                      Colors.black.withOpacity(0.70),
                    ],
                  ),
                ),
              ),

              // child
              Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: List.generate(
                    _icons.length,
                    (index) {
                      return Expanded(
                        key: _icons[index].id,
                        child: CupertinoButton(
                          onPressed: () {
                            ref.read(bottomNavigationProvider.notifier).state =
                                index;
                          },
                          child: AnimatedOpacity(
                            opacity: currentIndex == index ? 1 : 0.5,
                            duration: const Duration(milliseconds: 200),
                            child: SizedBox(
                              height: height * AppDimensions.height36,
                              width: height * AppDimensions.height36,
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  ImageIcon(
                                    ref.watch(bottomNavigationProvider) == index
                                        ? AssetImage(_icons[index].name)
                                        : AssetImage(
                                            _inactiveIcons[index].name),
                                    size: height * AppDimensions.height26,
                                    color:
                                        ref.watch(bottomNavigationProvider) ==
                                                index
                                            ? AppColors.orangeColor
                                            : Colors.white,
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
    //     SafeArea(
    //   child: Container(
    //     height: 70,
    //     width: 200,
    //     decoration: BoxDecoration(
    //       color: Colors.transparent,
    //       borderRadius: BorderRadius.circular(
    //         height * AppDimensions.height46,
    //       ),
    //       // boxShadow: [
    //       //   BoxShadow(
    //       //     color: Colors.grey.shade500,
    //       //     offset: const Offset(0, 2),
    //       //     blurRadius: 5,
    //       //   )
    //       // ],
    //     ),
    //     child: Stack(
    //       children: [
    //         // blur
    //         BackdropFilter(
    //           filter: ImageFilter.blur(
    //             sigmaX: 4.0,
    //             sigmaY: 4.0,
    //           ),
    //           child: Container(),
    //         ),
    //         // gradient
    //         Container(
    //           decoration: BoxDecoration(
    //             borderRadius: BorderRadius.circular(20),
    //             border: Border.all(
    //               color: Colors.white.withOpacity(0.13),
    //             ),
    //             gradient: LinearGradient(
    //               colors: [
    //                 Colors.black.withOpacity(0.5),
    //                 Colors.black.withOpacity(0.5),
    //               ],
    //             ),
    //           ),
    //           child: Row(
    //             mainAxisAlignment: MainAxisAlignment.spaceBetween,
    //             children: List.generate(
    //               _icons.length,
    //               (index) {
    //                 return Expanded(
    //                   key: _icons[index].id,
    //                   child: CupertinoButton(
    //                     onPressed: () {
    //                       ref.read(bottomNavigationProvider.notifier).state =
    //                           index;
    //                     },
    //                     child: AnimatedOpacity(
    //                       opacity: currentIndex == index ? 1 : 0.5,
    //                       duration: const Duration(milliseconds: 200),
    //                       child: SizedBox(
    //                         height: 36,
    //                         width: 36,
    //                         child: Column(
    //                           mainAxisSize: MainAxisSize.min,
    //                           mainAxisAlignment: MainAxisAlignment.center,
    //                           children: [
    //                             ImageIcon(
    //                               AssetImage(_icons[index].name),
    //                               size: height * AppDimensions.height26,
    //                               color: Colors.black,
    //                             )
    //                           ],
    //                         ),
    //                       ),
    //                     ),
    //                   ),
    //                 );
    //               },
    //             ),
    //           ),
    //         ),
    //       ],
    //     ),
    //   ),
    // );
  }
}
