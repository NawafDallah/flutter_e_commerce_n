import 'package:flutter/cupertino.dart';

import '../../../../../common/utils/constants/colors.dart';

class SearchBarCupertino extends StatelessWidget {
  const SearchBarCupertino({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const CupertinoSearchTextField(
      decoration: BoxDecoration(
        color: CupertinoColors.tertiarySystemFill,
        borderRadius: BorderRadius.all(Radius.circular(8.0)),
        border: Border(
          bottom: BorderSide(color: NColors.primary),
        ),
      ),
    );
  }
}
