import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../../common/utils/constants/colors.dart';
import '../../../../../common/utils/functions/functions.dart';
import '../../../../../core/entities/products_entity.dart';
import '../../../../favorite/presentation/bloc/local_product_bloc/favorite_product_bloc.dart';

class FavoriteIcon extends StatelessWidget {
  const FavoriteIcon({super.key, required this.product});

  final ProductEntity product;

  @override
  Widget build(BuildContext context) {
    final isDark = NFunctions.isDarkMode(context);

    return BlocBuilder<FavoriteProductBloc, FavoriteProductState>(
      builder: (context, state) {
        bool isFavorite = false;
        if (state is GetFavoriteProductsSuccess) {
          isFavorite = state.isFavorite(product);
        }
        return Container(
          width: 50,
          height: 50,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: isDark
                ? NColors.dark.withOpacity(0.5)
                : NColors.white.withOpacity(0.5),
          ),
          child: IconButton(
            onPressed: () {
              context
                  .read<FavoriteProductBloc>()
                  .add(ToggleFavoriteProductEvent(product: product));
            },
            icon: Icon(
              isFavorite ? Iconsax.heart5 : Iconsax.heart,
              color: isFavorite ? Colors.red : null,
            ),
          ),
        );
      },
    );
  }
}
