import 'package:flutter_e_commerce_n_1/common/utils/extensions/translate_x_extension.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/entities/products_entity.dart';
import '../bloc/local_product_bloc/favorite_product_bloc.dart';
import '../bloc/selected_favorite_product/selected_favorite_product_cubit.dart';

class UnlikeProductsSheet extends StatelessWidget {
  const UnlikeProductsSheet({
    super.key,
    required this.favoriteProductSet,
    required this.removeItems,
  });

  final Set<ProductEntity> favoriteProductSet;
  final void Function(List<ProductEntity>) removeItems;

  @override
  Widget build(BuildContext context) {
    return CupertinoActionSheet(
      title: Text("unlikeProducts".tr(context)),
      message: Text(
        "WantToUnlikeTheseProducts".tr(context),
      ),
      cancelButton: CupertinoActionSheetAction(
        onPressed: () {
          Navigator.pop(context);
        },
        isDefaultAction: true,
        child: Text("cancel".tr(context)),
      ),
      actions: [
        CupertinoActionSheetAction(
          onPressed: () {
            // remove products from animated grid.
            removeItems(favoriteProductSet.toList());
            // remove products from floor local database.
            context.read<FavoriteProductBloc>().add(
                  DeleteFavoriteProductsEvent(
                    products: favoriteProductSet.toList(),
                  ),
                );
            // clear the set of selected product.
            context.read<SelectedFavoriteProductsCubit>().clearSelection();
            Navigator.pop(context);
          },
          isDefaultAction: true,
          isDestructiveAction: true,
          child: Text("unlike".tr(context)),
        ),
      ],
    );
  }
}
