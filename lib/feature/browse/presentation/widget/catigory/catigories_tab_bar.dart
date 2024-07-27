import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../common/utils/constants/colors.dart';
import '../../../../../common/utils/functions/functions.dart';
import '../../../domain/entity/catigory_entity.dart';
import '../../bloc/browse/product_category_bloc/product_category_bloc.dart';

class CatigoriesTabBar extends StatelessWidget {
  const CatigoriesTabBar({
    super.key,
    required this.categories,
    required this.controller,
  });

  final List<CatigoryEntity> categories;
  final TabController controller;

  @override
  Widget build(BuildContext context) {
    final isDark = NFunctions.isDarkMode(context);
    final isArabic = NFunctions.isArabic(context);
    return ColoredBox(
      color: isDark ? NColors.black : NColors.white,
      child: TabBar(
        controller: controller,
        onTap: (value) {
          context.read<ProductCategoryBloc>().add(GetProductsEvent(
                categoryId: value + 1,
                page: 1,
                itemsPerPage: 50,
              ));
        },
        physics: const BouncingScrollPhysics(),
        isScrollable: true,
        padding: EdgeInsets.zero,
        indicatorColor: NColors.primary,
        unselectedLabelColor: NColors.darkGrey,
        labelColor: NColors.secondary,
        tabs: List.generate(
          categories.length,
          (index) => Tab(
            text: isArabic
                ? categories[index].categoryNameAr
                : categories[index].categoryNameEn,
          ),
        ),
      ),
    );
  }
}
