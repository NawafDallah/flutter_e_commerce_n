import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_e_commerce_n_1/common/utils/extensions/translate_x_extension.dart';

import '../../../../../common/utils/constants/sizes.dart';
import '../../../../../common/utils/functions/functions.dart';
import '../../../../../config/routes/routes.dart';
import '../../bloc/browse/search_product/search_product_bloc.dart';
import '../../screen/details_page.dart';
import '../../screen/search.dart';

class SearchPageContent extends StatelessWidget {
  const SearchPageContent({super.key, required this.widget});

  final SearchPage widget;

  @override
  Widget build(BuildContext context) {
    final isArabic = NFunctions.isArabic(context);
    return BlocBuilder<SearchProductBloc, SearchProductState>(
      builder: (context, state) {
        if (state is SearchProductLoading) {
          return const SliverFillRemaining(
            child: CupertinoActivityIndicator(),
          );
        }
        if (state is SearchProductFailure) {
          return SliverFillRemaining(
            child: Center(
              child: Text(
                state.error.tr(context),
                style: Theme.of(context).textTheme.headlineMedium,
              ),
            ),
          );
        }
        if (state is SearchProductSuccess) {
          return SliverPadding(
            padding: const EdgeInsets.symmetric(horizontal: NSizes.md),
            sliver: SliverList.separated(
              itemCount: state.products.length,
              separatorBuilder: (context, _) => const Divider(),
              itemBuilder: (context, index) {
                final product = state.products[index];
                return ListTile(
                  dense: true,
                  contentPadding: EdgeInsets.zero,
                  title: Text(
                    isArabic ? product.itemNameAr : product.itemNameEn,
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                  onTap: () => Navigator.push(
                    context,
                    PageRouteBuilder(
                      transitionsBuilder: (_, animation, __, child) =>
                          FadeTransition(
                        opacity: CurvedAnimation(
                          parent: animation,
                          curve: const Interval(0.0, 0.5),
                        ),
                        child: child,
                      ),
                      pageBuilder: (_, animation, __) => DetailsPage(
                        product: product,
                        animation: animation,
                      ),
                    ),
                  ),
                );
              },
            ),
          );
        }
        return SliverPadding(
          padding: const EdgeInsets.symmetric(horizontal: NSizes.md),
          sliver: SliverList.separated(
            itemCount: widget.catigories.length,
            separatorBuilder: (context, _) => const Divider(),
            itemBuilder: (context, index) => ListTile(
              contentPadding: EdgeInsets.zero,
              dense: true,
              title: Text(
                isArabic
                    ? widget.catigories[index].categoryNameAr
                    : widget.catigories[index].categoryNameEn,
                style: Theme.of(context).textTheme.bodyLarge,
              ),
              onTap: () => Navigator.pushNamed(
                context,
                Routes.catigory,
                arguments: {
                  'index': index,
                  'categories': widget.catigories,
                },
              ),
            ),
          ),
        );
      },
    );
  }
}
