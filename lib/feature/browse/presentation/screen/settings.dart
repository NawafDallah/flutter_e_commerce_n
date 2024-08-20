import 'package:flutter_e_commerce_n_1/common/utils/extensions/translate_x_extension.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';

import '../../../../common/utils/constants/colors.dart';
import '../../../../common/utils/constants/sizes.dart';
import '../../../../common/utils/functions/functions.dart';
import '../../../../common/widgets/my_dialog.dart';
import '../../../../common/widgets/responsive.dart';
import '../../../../core/cubits/locale/localization_cubit.dart';
import '../../../../core/cubits/theme_mode/theme_mode_cubit.dart';
import '../../../../init_dependencies.dart';
import '../bloc/settings/notification/notification_switch_cubit.dart';
import '../widget/settings/about_app_section.dart';
import '../widget/settings/account_section.dart';
import '../widget/settings/animated_circle_profile.dart';
import '../widget/settings/appearence_section.dart';
import '../widget/settings/language_section.dart';

class Settings extends StatefulWidget {
  const Settings({super.key});

  @override
  State<Settings> createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  late ScrollController _scrollController;
  final ValueNotifier<double> _scrollNotifire = ValueNotifier<double>(0.0);
  final ValueNotifier<String?> _themeNotifire = ValueNotifier<String?>(null);
  final ValueNotifier<String?> _languageNotifire = ValueNotifier<String?>(null);

  _onScrollLesten() {
    final scrollValue = _scrollController.offset /
        ((NFunctions.screenHeight(context) * 0.2) - 50);
    final limitValue = scrollValue.clamp(0.0, 1.0);
    _scrollNotifire.value = limitValue;
  }

  @override
  void initState() {
    _scrollController = ScrollController()..addListener(_onScrollLesten);
    final theme = context.read<ThemeModeCubit>().state;
    final language = context.read<LocalizationCubit>().state;
    _themeNotifire.value = theme.themeMode.name;
    _languageNotifire.value = language.locale.toString();
    super.initState();
  }

  @override
  void dispose() {
    _scrollController
      ..removeListener(_onScrollLesten)
      ..dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final user = sl<Box>().get("currentUser");
    final isDark = NFunctions.isDarkMode(context);
    final isSmallMobile = Responsive.isSmallMobile(context);
    final isTablet = Responsive.isTablet(context);
    return BlocProvider(
      create: (context) => NotificationSwitchCubit(),
      child: CustomScrollView(
        controller: _scrollController,
        physics: const BouncingScrollPhysics(),
        slivers: [
          SliverAppBar(
            automaticallyImplyLeading: false,
            pinned: true,
            stretch: true,
            backgroundColor: isDark ? NColors.black : NColors.white,
            centerTitle: true,
            expandedHeight: isSmallMobile
                ? NFunctions.screenHeight(context) * 0.25
                : NFunctions.screenHeight(context) * 0.2,
            title: ValueListenableBuilder(
              valueListenable: _scrollNotifire,
              builder: (_, value, child) {
                return Opacity(
                  opacity: value,
                  child: child,
                );
              },
              child: Text("settings".tr(context)),
            ),
            flexibleSpace: ValueListenableBuilder(
              valueListenable: _scrollNotifire,
              builder: (_, value, __) => FlexibleSpaceBar(
                titlePadding: EdgeInsetsDirectional.only(
                  top: value == 0 ? 0.0 : kToolbarHeight / 2,
                  start: value == 0 ? 0.0 : NSizes.md,
                ),
                title: AnimatedCircleProfile(
                  value: value,
                  child: Text(
                    user['userName']
                        .toString()
                        .substring(0, value == 0 ? 2 : 1)
                        .toUpperCase(),
                  ),
                ),
              ),
            ),
          ),
          SliverList.list(
            children: [
              // the account section
              const AccountSection(),

              // the appearence section
              AppearenceSection(themeNotifire: _themeNotifire),

              // the language local section
              LanguageSection(languageNotifire: _languageNotifire),

              // about the app
              const AboutAppSection(),

              SizedBox(height: isTablet ? NSizes.lg * 3 : NSizes.lg),

              // the logout button to show dialog
              Padding(
                padding: isTablet
                    ? const EdgeInsets.symmetric(horizontal: NSizes.xl * 2)
                    : const EdgeInsets.symmetric(horizontal: NSizes.lg),
                child: OutlinedButton(
                  onPressed: () {
                    showCupertinoDialog(
                      context: context,
                      builder: (context) => MyDialog(
                        title: 'areYouSure'.tr(context),
                        defaultText: 'cancel'.tr(context),
                        destructiveText: 'yes'.tr(context),
                      ),
                    );
                  },
                  child: Text(
                    "logout".tr(context),
                    style: TextStyle(
                      color: Colors.red.shade800,
                    ),
                  ),
                ),
              ),

              SizedBox(height: isTablet ? NSizes.lg * 2 : NSizes.lg),

              // app version
              Center(
                child: Text(
                  'Version 1.0.0',
                  style: Theme.of(context)
                      .textTheme
                      .labelMedium!
                      .copyWith(fontSize: NSizes.md),
                ),
              ),
            ],
          ),
          SliverToBoxAdapter(
            child: SizedBox(height: NFunctions.screenHeight(context) * 0.15),
          ),
        ],
      ),
    );
  }
}
