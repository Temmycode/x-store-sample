import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sample_ecommerce/provider/bottom_navigation_provider.dart';
import 'package:sample_ecommerce/screens/widgets/bottom_navigation_widget.dart';
import 'package:sample_ecommerce/utils/constants/screens.dart';
import 'package:sample_ecommerce/utils/settings/dimensions/dimensions.dart';

class BottomNavigationScreen extends ConsumerWidget {
  const BottomNavigationScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final width = MediaQuery.of(context).size.width;
    final currentIndex = ref.watch(bottomNavigationProvider);
    return Scaffold(
      extendBody: true,
      body: screens[currentIndex],
      bottomNavigationBar: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: width * AppDimensions.width35,
        ),
        child: const BottomNavigationWidget(),
      ),
    );
  }
}
