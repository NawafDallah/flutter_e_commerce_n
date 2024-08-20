import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconsax/iconsax.dart';
import 'package:flutter_e_commerce_n_1/common/utils/extensions/translate_x_extension.dart';

import '../../../../../common/widgets/section_list.dart';
import '../../../../../core/cubits/locale/localization_cubit.dart';
import 'my_list_tile.dart';

class LanguageSection extends StatelessWidget {
  const LanguageSection({
    super.key,
    required ValueNotifier<String?> languageNotifire,
  }) : _languageNotifire = languageNotifire;

  final ValueNotifier<String?> _languageNotifire;

  @override
  Widget build(BuildContext context) {
    return SectionList(
      text: "appLanguage".tr(context),
      tilesList: [
        // arabic language
        GestureDetector(
          onTap: () {
            context.read<LocalizationCubit>().changeLanguage("ar");
            _languageNotifire.value = "ar";
          },
          child: ValueListenableBuilder(
            valueListenable: _languageNotifire,
            builder: (_, value, __) => MyListTile(
              color: Colors.green.shade500,
              text: "arabic".tr(context),
              leadingIcon: const Icon(
                Icons.language,
              ),
              trailing: CupertinoRadio(
                value: "ar",
                groupValue: value,
                onChanged: (value) {},
                useCheckmarkStyle: true,
              ),
            ),
          ),
        ),

        // english language
        GestureDetector(
          onTap: () {
            context.read<LocalizationCubit>().changeLanguage("en");
            _languageNotifire.value = "en";
          },
          child: ValueListenableBuilder(
            valueListenable: _languageNotifire,
            builder: (_, value, __) => MyListTile(
              color: Colors.brown.shade600,
              text: "english".tr(context),
              leadingIcon: const Icon(Iconsax.language_circle5),
              trailing: CupertinoRadio(
                value: "en",
                groupValue: value,
                onChanged: (value) {},
                useCheckmarkStyle: true,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
