import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_e_commerce_n_1/common/utils/extensions/translate_x_extension.dart';

import '../../../../../common/widgets/section_list.dart';
import '../../../../../core/cubits/theme_mode/theme_mode_cubit.dart';
import 'my_list_tile.dart';

class AppearenceSection extends StatelessWidget {
  const AppearenceSection({
    super.key,
    required ValueNotifier<String?> themeNotifire,
  }) : _themeNotifire = themeNotifire;

  final ValueNotifier<String?> _themeNotifire;

  @override
  Widget build(BuildContext context) {
    return SectionList(
      text: "appAppearence".tr(context),
      tilesList: [
        // always dark
        GestureDetector(
          onTap: () {
            context.read<ThemeModeCubit>().changeThemeMode("dark");
            _themeNotifire.value = "dark";
          },
          child: ValueListenableBuilder(
            valueListenable: _themeNotifire,
            builder: (_, value, __) => MyListTile(
              color: Colors.deepPurple,
              text: "dark".tr(context),
              leadingIcon: const Icon(
                CupertinoIcons.moon_fill,
              ),
              trailing: CupertinoRadio(
                value: "dark",
                groupValue: value,
                onChanged: (value) {},
                useCheckmarkStyle: true,
              ),
            ),
          ),
        ),

        // always light
        GestureDetector(
          onTap: () {
            context.read<ThemeModeCubit>().changeThemeMode("light");
            _themeNotifire.value = "light";
          },
          child: ValueListenableBuilder(
            valueListenable: _themeNotifire,
            builder: (_, value, __) => MyListTile(
              color: Colors.orange.shade400,
              text: "light".tr(context),
              leadingIcon: const Icon(
                CupertinoIcons.sun_max_fill,
              ),
              trailing: CupertinoRadio(
                value: "light",
                groupValue: value,
                onChanged: (value) {},
                useCheckmarkStyle: true,
              ),
            ),
          ),
        ),

        // system appearence match
        GestureDetector(
          onTap: () {
            context.read<ThemeModeCubit>().changeThemeMode("system");
            _themeNotifire.value = "system";
          },
          child: ValueListenableBuilder(
            valueListenable: _themeNotifire,
            builder: (_, value, __) => MyListTile(
              color: Colors.grey.shade600,
              text: "matchSystem".tr(context),
              leadingIcon: const Icon(
                Icons.system_security_update,
              ),
              trailing: CupertinoRadio(
                value: "system",
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
