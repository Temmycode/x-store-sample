import 'package:flutter/material.dart';
import 'package:sample_ecommerce/mock/constants/promotion_constants.dart';
import 'package:sample_ecommerce/screens/widgets/appbar.dart';
import 'package:sample_ecommerce/screens/widgets/category_tab_bar_view.dart';
import 'package:sample_ecommerce/screens/widgets/promotion_container.dart';
import 'package:sample_ecommerce/utils/constants/item_category_constants.dart';
import 'package:sample_ecommerce/utils/settings/dimensions/dimensions.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  late final TabController _tabController;
  PageController _pageController = PageController();

  @override
  void initState() {
    super.initState();
    _tabController = TabController(
      length: itemCategoryConstant.length,
      vsync: this,
    );
    _pageController = PageController();
  }

  @override
  void dispose() {
    super.dispose();
    _tabController.dispose();
    _pageController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        bottom: false,
        minimum: EdgeInsets.only(top: height * AppDimensions.height82),
        child: NestedScrollView(
          headerSliverBuilder: (context, innerBoxIsScrolled) {
            return [
              const CustomAppBar(),
              // promotions
              SliverToBoxAdapter(
                child: SizedBox(height: height * AppDimensions.height33),
              ),
              SliverPadding(
                padding: EdgeInsets.symmetric(
                  horizontal: width * AppDimensions.width35,
                ),
                sliver: SliverToBoxAdapter(
                  child: SizedBox(
                    height: height * AppDimensions.height192,
                    child: PageView.builder(
                      padEnds: true,
                      controller: _pageController,
                      itemCount: promotionConstants.length,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: PromotionContainer(
                            image: promotionConstants[index][0],
                          ),
                        );
                      },
                    ),
                  ),
                ),
              ),
              SliverToBoxAdapter(
                child: SizedBox(
                  height: height * AppDimensions.height36,
                ),
              ),
              // ITEM CATEGORY SECTIONS:
              SliverToBoxAdapter(
                child: Align(
                  alignment: Alignment.center,
                  child: TabBar(
                    labelStyle: const TextStyle(fontWeight: FontWeight.w700),
                    unselectedLabelStyle:
                        const TextStyle(fontWeight: FontWeight.w400),
                    labelColor: Colors.black,
                    indicatorColor: Colors.black,
                    indicatorWeight: 2,
                    isScrollable: true,
                    controller: _tabController,
                    tabs: itemCategoryConstant
                        .map(
                          (item) => Tab(
                            text: item,
                            // st
                          ),
                        )
                        .toList(),
                  ),
                ),
              ),
              SliverToBoxAdapter(
                child: SizedBox(height: height * AppDimensions.height26),
              ),
            ];
          },

          // ITEM CATEOGRY
          // data here should be loaded form the provider and the loading screen should be displayed
          // the loading screening is intended to be a shimmer of the current UI
          body: TabBarView(
            controller: _tabController,
            children: itemCategoryConstant
                .map(
                  (item) =>
                      // passing the category to the grid view to display the data in the different categories
                      CategoryTabView(
                    category: item,
                  ),
                )
                .toList(),
          ),
        ),
      ),
    );
  }
}
