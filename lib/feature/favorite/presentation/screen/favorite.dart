import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_e_commerce_n_1/common/utils/extensions/translate_x_extension.dart';
import '../../../../common/utils/constants/image_strings.dart';
import '../../../../common/utils/constants/sizes.dart';
import '../../../../common/widgets/empty_page.dart';
import '../../../../common/widgets/responsive.dart';
import '../../../../core/entities/products_entity.dart';
import '../bloc/edit_btn_cubit/edit_btn_clicked_cubit.dart';
import '../../../browse/presentation/widget/home/fade_logo.dart';
import '../bloc/local_product_bloc/favorite_product_bloc.dart';
import '../bloc/selected_favorite_product/selected_favorite_product_cubit.dart';
import '../widget/favorite_app_bar.dart';
import '../widget/favorite_vertical_card.dart';

class Favorite extends StatefulWidget {
  const Favorite({super.key});

  @override
  State<Favorite> createState() => _FavoriteState();
}

class _FavoriteState extends State<Favorite> {
  late final ScrollController _scrollController;
  final _scrollNotifier = ValueNotifier<double>(0.0);
  final GlobalKey<SliverAnimatedGridState> _gridKey =
      GlobalKey<SliverAnimatedGridState>();
  List<ProductEntity> _products = [];

  @override
  void initState() {
    _scrollController = ScrollController()..addListener(_scrollListener);
    context
        .read<FavoriteProductBloc>()
        .add(const GetSavedFavoriteProductEvent());
    super.initState();
  }

  @override
  void dispose() {
    _scrollController
      ..removeListener(_scrollListener)
      ..dispose();
    super.dispose();
  }

  _scrollListener() {
    // Calculate the over-scroll amount
    double overScroll = _scrollController.offset -
        (_scrollController.position.maxScrollExtent + 50);
    if (overScroll > 0) {
      _scrollNotifier.value =
          (overScroll / (kBottomNavigationBarHeight * 5)).clamp(0.0, 1.0);
    } else {
      _scrollNotifier.value = 0.0;
    }
  }

  // removed products from the animated grid
  void _removeItems(List<ProductEntity> productsToRemove) {
    for (var product in productsToRemove) {
      final index = _products.indexWhere((p) => p.itemId == product.itemId);
      if (index != -1) {
        _gridKey.currentState?.removeItem(
          index,
          (context, animation) => ScaleTransition(
            scale: animation,
            child: FavoriteVerticalCard(
              isCardSelected: false,
              isEditBtnClicked: false,
              product: product,
            ),
          ),
        );
      }
      _products.removeAt(index);
    }
  }

  @override
  Widget build(BuildContext context) {
    final isTablet = Responsive.isTablet(context);
    final selectedFavoriteProductsCubit = SelectedFavoriteProductsCubit();
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => EditBtnClickedCubit(),
        ),
        BlocProvider(
          create: (context) => selectedFavoriteProductsCubit,
        ),
      ],
      child: Scaffold(
        body: CupertinoScrollbar(
          controller: _scrollController,
          child: Stack(
            children: [
              // BOTTOM FADE LOGO
              FadeLogo(logoNotifire: _scrollNotifier),
              Builder(
                builder: (context) {
                  // multiple bloc builder
                  final favoriteProductSet =
                      context.watch<SelectedFavoriteProductsCubit>().state;
                  final isEditBtnClicked =
                      context.watch<EditBtnClickedCubit>().state;
                  return CustomScrollView(
                    controller: _scrollController,
                    physics: const BouncingScrollPhysics(),
                    slivers: [
                      // SLIVER APP BAR AS IOS STYLE
                      FavoriteAppBar(
                        selectedFavoriteProductsCubit:
                            selectedFavoriteProductsCubit,
                        favoritProductSet: favoriteProductSet,
                        removeItems: _removeItems,
                      ),
                      // THE ANIMTED GRID VIEW
                      SliverPadding(
                        padding: const EdgeInsets.only(
                          left: NSizes.xs,
                          right: NSizes.xs,
                          top: NSizes.md,
                          bottom: kBottomNavigationBarHeight * 1.5,
                        ),
                        sliver: BlocBuilder<FavoriteProductBloc,
                            FavoriteProductState>(
                          builder: (context, state) {
                            if (state is GetFavoriteProductsSuccess) {
                              _products = List.from(state.products);
                              if (state.products.isEmpty) {
                                return SliverToBoxAdapter(
                                  child: Column(
                                    children: [
                                      const EmptyPage(
                                        image: NImages.emptyPage,
                                        text: "noProductsFound",
                                      ),
                                      Text(
                                        'noFavoriteProductsFound'.tr(context),
                                        textAlign: TextAlign.center,
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyLarge,
                                      )
                                    ],
                                  ),
                                );
                              }
                              return SliverAnimatedGrid(
                                key: _gridKey,
                                initialItemCount: state.products.length,
                                gridDelegate:
                                    SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: isTablet ? 3 : 2,
                                  mainAxisSpacing: 35,
                                  mainAxisExtent: NSizes.cradVerticallHeight,
                                ),
                                itemBuilder: (_, index, animation) {
                                  final isSelected = favoriteProductSet
                                      .contains(state.products[index]);
                                  return GestureDetector(
                                    onTap: () {
                                      if (isEditBtnClicked) {
                                        context
                                            .read<
                                                SelectedFavoriteProductsCubit>()
                                            .toggleSelection(
                                                state.products[index]);
                                      }
                                    },
                                    child: ScaleTransition(
                                      scale: animation,
                                      key: UniqueKey(),
                                      child: FavoriteVerticalCard(
                                        isCardSelected: isSelected,
                                        isEditBtnClicked: isEditBtnClicked,
                                        product: state.products[index],
                                      ),
                                    ),
                                  );
                                },
                              );
                            }
                            return const SliverToBoxAdapter();
                          },
                        ),
                      )
                    ],
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
