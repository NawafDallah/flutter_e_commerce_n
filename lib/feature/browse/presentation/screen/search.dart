import 'package:flutter_e_commerce_n_1/common/utils/extensions/translate_x_extension.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../common/utils/constants/colors.dart';
import '../../../../common/utils/functions/functions.dart';
import '../../domain/entity/catigory_entity.dart';
import '../widget/search/animated_search_bar.dart';
import '../widget/search/search_page_content.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key, required this.catigories});

  final List<CatigoryEntity> catigories;

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  final FocusNode searchFocusNode = FocusNode();
  final ValueNotifier<bool> isFocusedNotifier = ValueNotifier<bool>(false);

  @override
  void initState() {
    super.initState();
    searchFocusNode.addListener(() {
      isFocusedNotifier.value = searchFocusNode.hasFocus;
    });
  }

  @override
  void dispose() {
    searchFocusNode.dispose();
    isFocusedNotifier.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final isDark = NFunctions.isDarkMode(context);

    return Scaffold(
      body: CustomScrollView(
        physics: const BouncingScrollPhysics(),
        slivers: [
          CupertinoSliverNavigationBar(
            backgroundColor: isDark ? NColors.black : NColors.white,
            stretch: true,
            leading: IconButton(
              icon: const Icon(CupertinoIcons.back),
              onPressed: () => Navigator.pop(context),
              color: NColors.primary,
            ),
            padding: EdgeInsetsDirectional.zero,
            largeTitle: Text(
              "search".tr(context),
              style: TextStyle(
                color: isDark ? NColors.light : NColors.dark,
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: AnimatedSearchBar(
              isFocusedNotifier: isFocusedNotifier,
              searchFocusNode: searchFocusNode,
            ),
          ),
          SearchPageContent(widget: widget),
        ],
      ),
    );
  }
}
