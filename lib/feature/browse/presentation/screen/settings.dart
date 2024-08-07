import 'package:flutter_e_commerce_n_1/common/utils/extensions/translate_x_extension.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../common/utils/constants/colors.dart';
import '../../../../common/utils/constants/sizes.dart';
import '../../../../common/utils/functions/functions.dart';
import '../../../../common/widgets/responsive.dart';
import '../../../../config/routes/routes.dart';
import '../../../../core/cubits/locale/localization_cubit.dart';
import '../../../../core/cubits/middleware/middleware_cubit.dart';
import '../../../../core/cubits/theme_mode/theme_mode_cubit.dart';
import '../../../../init_dependencies.dart';
import '../bloc/settings/notification/notification_switch_cubit.dart';

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
    final isArabic = NFunctions.isArabic(context);
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
          AnimationLimiter(
            child: AnimationConfiguration.staggeredList(
              position: 0,
              duration: const Duration(milliseconds: 500),
              child: SliverList.list(
                children: [
                  // the account section
                  SectionList(
                    text: "myAccount".tr(context),
                    tilesList: [
                      // user profile
                      GestureDetector(
                        onTap: () {
                          Navigator.pushNamed(context, Routes.profile);
                        },
                        child: MyListTile(
                          color: Colors.amber.shade600,
                          text: "profile".tr(context),
                          leadingIcon: const Icon(
                            CupertinoIcons.person_fill,
                          ),
                          trailing: Icon(
                            isArabic
                                ? Icons.keyboard_arrow_left
                                : Icons.keyboard_arrow_right,
                          ),
                        ),
                      ),

                      // the notification
                      MyListTile(
                        color: Colors.red.shade600,
                        text: "notification".tr(context),
                        leadingIcon: const Icon(
                          CupertinoIcons.bell_fill,
                        ),
                        trailing: BlocBuilder<NotificationSwitchCubit, bool>(
                          builder: (context, state) {
                            return CupertinoSwitch(
                              value: state,
                              onChanged: (bool value) {
                                context
                                    .read<NotificationSwitchCubit>()
                                    .toggleSwitch();
                              },
                            );
                          },
                        ),
                      ),

                      // address
                      MyListTile(
                        color: Colors.blue.shade600,
                        text: "address".tr(context),
                        leadingIcon: const Icon(
                          CupertinoIcons.location_solid,
                        ),
                        trailing: Icon(
                          isArabic
                              ? Icons.keyboard_arrow_left
                              : Icons.keyboard_arrow_right,
                        ),
                      ),

                      // peyment method cards
                      MyListTile(
                        color: Colors.blue.shade600,
                        text: "peymentCards".tr(context),
                        leadingIcon: const Icon(
                          Icons.wallet,
                        ),
                        trailing: Icon(
                          isArabic
                              ? Icons.keyboard_arrow_left
                              : Icons.keyboard_arrow_right,
                        ),
                      ),
                    ],
                  ),

                  // the appearence section
                  SectionList(
                    text: "appAppearence".tr(context),
                    tilesList: [
                      // always dark
                      GestureDetector(
                        onTap: () {
                          context
                              .read<ThemeModeCubit>()
                              .changeThemeMode("dark");
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
                          context
                              .read<ThemeModeCubit>()
                              .changeThemeMode("light");
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
                          context
                              .read<ThemeModeCubit>()
                              .changeThemeMode("system");
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
                  ),

                  // the language local section
                  SectionList(
                    text: "appLanguage".tr(context),
                    tilesList: [
                      // arabic language
                      GestureDetector(
                        onTap: () {
                          context
                              .read<LocalizationCubit>()
                              .changeLanguage("ar");
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
                          context
                              .read<LocalizationCubit>()
                              .changeLanguage("en");
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
                  ),

                  // about the app
                  SectionList(
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
                            isArabic
                                ? Icons.keyboard_arrow_left
                                : Icons.keyboard_arrow_right,
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
                            isArabic
                                ? Icons.keyboard_arrow_left
                                : Icons.keyboard_arrow_right,
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
                            isArabic
                                ? Icons.keyboard_arrow_left
                                : Icons.keyboard_arrow_right,
                          ),
                        ),
                      ),
                    ],
                  ),

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
                            defaultText: 'yse'.tr(context),
                            destructiveText: 'cancel'.tr(context),
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
            ),
          ),
          SliverToBoxAdapter(
            child: SizedBox(height: NFunctions.screenHeight(context) * 0.15),
          ),
        ],
      ),
    );
  }
}

class MyDialog extends StatelessWidget {
  const MyDialog({
    super.key,
    required this.title,
    required this.defaultText,
    required this.destructiveText,
  });

  final String title;
  final String defaultText;
  final String destructiveText;

  @override
  Widget build(BuildContext context) {
    return TweenAnimationBuilder<Offset>(
      duration: const Duration(milliseconds: 200),
      tween: Tween(
        begin: const Offset(0.0, 350.0),
        end: Offset.zero,
      ),
      builder: (_, value, child) {
        return Transform.translate(
          offset: value,
          child: child!,
        );
      },
      child: CupertinoAlertDialog(
        title: Text(title),
        actions: [
          CupertinoDialogAction(
            isDefaultAction: true,
            onPressed: () {
              Navigator.pop(context);
            },
            child: Text(defaultText),
          ),
          CupertinoDialogAction(
            isDefaultAction: true,
            isDestructiveAction: true,
            onPressed: () {
              context
                  .read<MiddlewareCubit>()
                  .changeMiddleWarePage(Routes.login);
              sl<Box>().clear();
              Navigator.pushNamedAndRemoveUntil(
                context,
                Routes.login,
                (route) => false,
              );
            },
            child: Text(destructiveText),
          ),
        ],
      ),
    );
  }
}

class SectionList extends StatelessWidget {
  const SectionList({
    super.key,
    this.tilesList,
    required this.text,
  });

  final List<Widget>? tilesList;
  final String text;

  @override
  Widget build(BuildContext context) {
    final isDark = NFunctions.isDarkMode(context);
    return SlideAnimation(
      verticalOffset: 50,
      child: FadeInAnimation(
        child: CupertinoListSection.insetGrouped(
          backgroundColor: isDark ? NColors.black : NColors.white,
          header: Text(
            text,
            style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                  fontWeight: FontWeight.bold,
                ),
          ),
          children: tilesList,
        ),
      ),
    );
  }
}

class MyListTile extends StatelessWidget {
  const MyListTile({
    super.key,
    required this.color,
    required this.text,
    required this.trailing,
    required this.leadingIcon,
  });

  final Color color;
  final String text;
  final Widget trailing;
  final Widget leadingIcon;

  @override
  Widget build(BuildContext context) {
    final isDark = NFunctions.isDarkMode(context);
    return CupertinoListTile(
      backgroundColor: isDark ? NColors.dark : NColors.light,
      leading: Container(
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(
            NSizes.borderRadiusSm,
          ),
          shape: BoxShape.rectangle,
        ),
        child: leadingIcon,
      ),
      trailing: trailing,
      title: Text(
        text,
        style: Theme.of(context).textTheme.bodyMedium!.copyWith(
              fontWeight: FontWeight.bold,
            ),
      ),
    );
  }
}

class AnimatedCircleProfile extends StatelessWidget {
  const AnimatedCircleProfile({
    super.key,
    required this.value,
    this.child,
  });

  final double value;
  final Widget? child;

  @override
  Widget build(BuildContext context) {
    final isDark = NFunctions.isDarkMode(context);
    return Align(
      alignment: AlignmentDirectional.lerp(
        const AlignmentDirectional(0.0, 0.85),
        const AlignmentDirectional(-1.0, 0.0),
        value,
      )!,
      child: AnimatedContainer(
        alignment: Alignment.center,
        duration: const Duration(milliseconds: 100),
        width: value == 0 ? 75.0 : 40.0,
        height: value == 0 ? 75.0 : 40.0,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: isDark ? NColors.dark : NColors.light,
          boxShadow: [
            BoxShadow(
              offset: const Offset(2, 2),
              blurRadius: value == 0
                  ? 2.0
                  : isDark
                      ? 0.0
                      : 2.0,
              spreadRadius: 0.0,
              color: isDark ? NColors.darkGrey : NColors.darkerGrey,
            ),
            BoxShadow(
              offset: const Offset(2, 2),
              color: isDark ? Colors.black : Colors.white,
              blurRadius: value == 0
                  ? 3.0
                  : isDark
                      ? 0.0
                      : 3.0,
              spreadRadius: 0.0,
            ),
          ],
        ),
        child: FittedBox(child: child),
      ),
    );
  }
}
