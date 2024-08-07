import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';

import '../../../../common/utils/constants/image_strings.dart';
import '../../../../common/utils/constants/sizes.dart';
import '../../../../common/widgets/empty_page.dart';
import '../../../../common/widgets/responsive.dart';
import '../../domain/entity/catigory_entity.dart';
import '../bloc/browse/product_category_bloc/product_category_bloc.dart';
import '../widget/catigory/background_space_bar.dart';
import '../widget/catigory/catigories_tab_bar.dart';
import '../widget/my_sliver_appbar.dart';
import '../widget/product_card/product_vertical_card.dart';

class CatigoriesPage extends StatefulWidget {
  const CatigoriesPage({
    super.key,
    required this.index,
    required this.categories,
  });

  final int index;
  final List<CatigoryEntity> categories;

  @override
  State<CatigoriesPage> createState() => _CatigoriesPageState();
}

class _CatigoriesPageState extends State<CatigoriesPage>
    with SingleTickerProviderStateMixin {
  late final ScrollController _scrollController;
  late final TabController _tabController;
  final int _currentpage = 1;
  final int _itemsPerPage = 50;

  @override
  void dispose() {
    _scrollController.dispose();
    _tabController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    _tabController = TabController(
      length: widget.categories.length,
      initialIndex: widget.index,
      vsync: this,
    );
    _scrollController = ScrollController();
    super.initState();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _fitchProduct();
  }

  _fitchProduct() {
    context.read<ProductCategoryBloc>().add(GetProductsEvent(
          categoryId: widget.categories[widget.index].categoryId,
          page: _currentpage,
          itemsPerPage: _itemsPerPage,
        ));
  }

  /// I will work later on pagination
  // _scrollListener() {
  //   if (_scrollController.position.maxScrollExtent ==
  //       _scrollController.position.pixels) {
  //     _currentpage++;
  //     _fitchProduct();
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    final isTablet = Responsive.isTablet(context);
    return Scaffold(
      body: NestedScrollView(
        headerSliverBuilder: (_, innerBoxIsScrolled) {
          return [
            MySliverAppBar(
              backgroundSpaceBar: const SpaceAppBarBackground(),
              tabBar: CatigoriesTabBar(
                categories: widget.categories,
                controller: _tabController,
              ),
            ),
          ];
        },
        body: TabBarView(
          controller: _tabController,
          physics: const NeverScrollableScrollPhysics(),
          children: List.generate(widget.categories.length, (index) {
            return BlocBuilder<ProductCategoryBloc, ProductCategoryState>(
              builder: (context, state) {
                if (state is GetProductFailureStata) {
                  return EmptyPage(
                    image: NImages.emptyPage,
                    text: state.error,
                  );
                }
                if (state is GetProductLoadingStata) {
                  return const Center(child: CupertinoActivityIndicator());
                }
                if (state is GetProductSuccessState) {
                  return AnimationLimiter(
                    child: GridView.builder(
                      itemCount: state.products.length,
                      padding: const EdgeInsets.only(
                        left: 4.0,
                        right: 4.0,
                        bottom: kBottomNavigationBarHeight,
                        top: 16.0,
                      ),
                      physics: const BouncingScrollPhysics(),
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: isTablet ? 3 : 2,
                        mainAxisSpacing: NSizes.gridViewSpacing * 2,
                        mainAxisExtent: NSizes.cradVerticallHeight,
                      ),
                      itemBuilder: (context, index) {
                        return AnimationConfiguration.staggeredGrid(
                          columnCount: isTablet ? 3 : 2,
                          position: index,
                          child: FadeInAnimation(
                            duration: const Duration(milliseconds: 700),
                            child: SlideAnimation(
                              verticalOffset: 150,
                              child: ProductVerticalCard(
                                product: state.products[index],
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  );
                }
                return const SizedBox();
              },
            );
          }),
        ),
      ),
    );
  }
}
