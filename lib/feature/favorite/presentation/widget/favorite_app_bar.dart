import 'package:flutter_e_commerce_n_1/common/utils/extensions/translate_x_extension.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../common/utils/constants/colors.dart';
import '../../../../common/utils/functions/functions.dart';
import '../../../../core/entities/products_entity.dart';
import '../bloc/edit_btn_cubit/edit_btn_clicked_cubit.dart';
import '../bloc/selected_favorite_product/selected_favorite_product_cubit.dart';
import 'toggle_texts.dart';
import 'unlike_products_sheet.dart';

class FavoriteAppBar extends StatelessWidget {
  const FavoriteAppBar({
    super.key,
    required this.favoritProductSet,
    required this.removeItems,
    required this.selectedFavoriteProductsCubit,
  });

  final Set<ProductEntity> favoritProductSet;
  final void Function(List<ProductEntity>) removeItems;
  final SelectedFavoriteProductsCubit selectedFavoriteProductsCubit;

  @override
  Widget build(BuildContext context) {
    final isDark = NFunctions.isDarkMode(context);
    return CupertinoSliverNavigationBar(
      backgroundColor: isDark
          ? NColors.black.withOpacity(0.5)
          : NColors.light.withOpacity(0.5),
      automaticallyImplyLeading: false,
      stretch: true,
      largeTitle: Text(
        "favorite".tr(context),
        style: TextStyle(
          color: isDark ? NColors.light : NColors.dark,
        ),
      ),
      leading: BlocBuilder<EditBtnClickedCubit, bool>(
        builder: (context, state) {
          return AnimatedOpacity(
            duration: const Duration(milliseconds: 200),
            opacity: state ? 1.0 : 0.0,
            child: IconButton(
              onPressed: favoritProductSet.isNotEmpty
                  ? () {
                      showCupertinoModalPopup(
                        context: context,
                        builder: (_) => BlocProvider.value(
                          value: selectedFavoriteProductsCubit,
                          child: UnlikeProductsSheet(
                            favoriteProductSet: favoritProductSet,
                            removeItems: removeItems,
                          ),
                        ),
                      );
                    }
                  : null,
              color: NColors.primary,
              icon: const Icon(Iconsax.trash),
            ),
          );
        },
      ),
      trailing: BlocBuilder<EditBtnClickedCubit, bool>(
        builder: (context, state) {
          return ToggleTrailingTexts(
            favoritProductSet: favoritProductSet,
            isClicked: state,
          );
        },
      ),
    );
  }
}
