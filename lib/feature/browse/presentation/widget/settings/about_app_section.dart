import 'package:flutter/material.dart';
import 'package:flutter_e_commerce_n_1/common/utils/extensions/translate_x_extension.dart';

import '../../../../../common/utils/functions/functions.dart';
import '../../../../../common/widgets/section_list.dart';
import 'my_list_tile.dart';

class AboutAppSection extends StatelessWidget {
  const AboutAppSection({super.key});

  @override
  Widget build(BuildContext context) {
    final isArabic = NFunctions.isArabic(context);
    return SectionList(
      text: "aboutApp".tr(context),
      tilesList: [
        // about us
        GestureDetector(
          onTap: () {},
          child: MyListTile(
            color: Colors.blueAccent,
            text: "aboutUs".tr(context),
            leadingIcon: const Icon(
              Icons.contact_support,
            ),
            trailing: Icon(
              isArabic ? Icons.keyboard_arrow_left : Icons.keyboard_arrow_right,
            ),
          ),
        ),

        // contact us
        GestureDetector(
          onTap: () {},
          child: MyListTile(
            color: Colors.blueAccent,
            text: "contantUs".tr(context),
            leadingIcon: const Icon(
              Icons.mobile_friendly,
            ),
            trailing: Icon(
              isArabic ? Icons.keyboard_arrow_left : Icons.keyboard_arrow_right,
            ),
          ),
        ),

        // privacy policy
        GestureDetector(
          onTap: () {},
          child: MyListTile(
            color: Colors.red.shade500,
            text: "privacyPolicy".tr(context),
            leadingIcon: const Icon(
              Icons.privacy_tip_sharp,
            ),
            trailing: Icon(
              isArabic ? Icons.keyboard_arrow_left : Icons.keyboard_arrow_right,
            ),
          ),
        ),
      ],
    );
  }
}
