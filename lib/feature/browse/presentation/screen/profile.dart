import 'package:flutter_e_commerce_n_1/common/utils/extensions/parse_to_int.dart';
import 'package:flutter_e_commerce_n_1/common/utils/extensions/translate_x_extension.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

import '../../../../common/utils/constants/colors.dart';
import '../../../../common/utils/constants/sizes.dart';
import '../../../../common/utils/functions/functions.dart';
import '../../../../common/utils/validators/validation.dart';
import '../../../../common/widgets/responsive.dart';
import '../../../../init_dependencies.dart';
import '../bloc/settings/profile/profile_cubit.dart';
import '../bloc/settings/settings_bloc/settings_bloc.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  late final TextEditingController _nameController;
  late final TextEditingController _emailController;
  late final TextEditingController _phoneController;
  late final GlobalKey<FormState> formKey;
  final user = sl<Box>().get("currentUser");
  @override
  void initState() {
    _nameController = TextEditingController(text: user['userName']);
    _emailController = TextEditingController(text: user['userEmail']);
    _phoneController =
        TextEditingController(text: "0${user['userPhone'].toString()}");
    formKey = GlobalKey<FormState>();
    super.initState();
  }

  @override
  void dispose() {
    _emailController.dispose();
    _nameController.dispose();
    _phoneController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final isDark = NFunctions.isDarkMode(context);
    final isTablet = Responsive.isTablet(context);
    return BlocProvider(
      create: (context) => ProfileCubit(),
      child: Builder(
        builder: (context) {
          return Scaffold(
            resizeToAvoidBottomInset: false,
            body: NestedScrollView(
              physics: const NeverScrollableScrollPhysics(),
              headerSliverBuilder: (_, __) => [
                CupertinoSliverNavigationBar(
                  stretch: true,
                  previousPageTitle: 'settings'.tr(context),
                  backgroundColor: isDark ? NColors.black : NColors.white,
                  largeTitle: Text(
                    "profile".tr(context),
                    style: TextStyle(
                      color: isDark ? NColors.light : NColors.dark,
                    ),
                  ),
                ),
              ],
              body: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: NSizes.md,
                  vertical: NSizes.xl,
                ),
                child: Form(
                  key: formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      // name
                      TextFormField(
                        cursorColor: NColors.primary,
                        keyboardType: TextInputType.name,
                        controller: _nameController,
                        onChanged: (value) {
                          if (value != user['userName'] &&
                              formKey.currentState!.validate()) {
                            context.read<ProfileCubit>().set(true);
                          } else {
                            context.read<ProfileCubit>().set(false);
                          }
                        },
                        validator: (value) {
                          return NValidator.validateUserName(value, context);
                        },
                        decoration: InputDecoration(
                          labelText: "username".tr(context),
                          floatingLabelAlignment: FloatingLabelAlignment.center,
                        ),
                      ),

                      //space
                      SizedBox(height: isTablet ? NSizes.xl * 2 : NSizes.xl),

                      // email
                      TextFormField(
                        cursorColor: NColors.primary,
                        keyboardType: TextInputType.name,
                        controller: _emailController,
                        enabled: false,
                        validator: (value) {
                          return NValidator.validateEmail(value, context);
                        },
                        decoration: InputDecoration(
                          labelText: "email".tr(context),
                          floatingLabelAlignment: FloatingLabelAlignment.center,
                        ),
                      ),

                      SizedBox(height: isTablet ? NSizes.xl * 2 : NSizes.xl),

                      // phone numer
                      TextFormField(
                        cursorColor: NColors.primary,
                        keyboardType: TextInputType.name,
                        controller: _phoneController,
                        onChanged: (value) {
                          if ("0$value" != user['userPhone'] &&
                              formKey.currentState!.validate()) {
                            context.read<ProfileCubit>().set(true);
                          } else {
                            context.read<ProfileCubit>().set(false);
                          }
                        },
                        validator: (value) {
                          return NValidator.validatePhoneNumber(value, context);
                        },
                        decoration: InputDecoration(
                          labelText: "phoneNo".tr(context),
                          floatingLabelAlignment: FloatingLabelAlignment.center,
                        ),
                      ),

                      const Spacer(),

                      // Save the changes Button
                      BlocListener<SettingsBloc, SettingsState>(
                        listener: (context, state) {
                          if (state is UpdateUserSuccessState) {
                            final userData = {
                              "userId": user['userId'],
                              "userEmail": user['userEmail'],
                              "userPhone": _phoneController.text.trim().toInt(),
                              "userName": _nameController.text.trim(),
                            };
                            NFunctions.showSnackBar(
                                context, 'user updated successfuly');
                            sl<Box>().put("currentUser", userData);
                            context.read<ProfileCubit>().set(false);
                          }
                          if (state is UpdateUserFailureState) {
                            NFunctions.showSnackBar(context, state.error);
                          }
                        },
                        child: SizedBox(
                          width: NFunctions.screenWidth(context),
                          child: Builder(
                            builder: (context) {
                              final profileState =
                                  context.watch<ProfileCubit>().state;
                              final settingsState =
                                  context.watch<SettingsBloc>().state;
                              return ElevatedButton(
                                onPressed: profileState
                                    ? () {
                                        if (formKey.currentState!.validate()) {
                                          context
                                              .read<SettingsBloc>()
                                              .add(UpdateUserEvent(
                                                userId: user['userId'],
                                                userPhone: _phoneController.text
                                                    .trim()
                                                    .toInt(),
                                                userName:
                                                    _nameController.text.trim(),
                                              ));
                                        }
                                      }
                                    : null,
                                child: settingsState is UpdateUserLoadingState
                                    ? const CupertinoActivityIndicator()
                                    : Text("save".tr(context)),
                              );
                            },
                          ),
                        ),
                      ),

                      const SizedBox(height: NSizes.md),

                      // Delete account Button
                      SizedBox(
                        width: NFunctions.screenWidth(context),
                        child: OutlinedButton(
                          onPressed: () {},
                          child: Text(
                            "deleteAccount".tr(context),
                            style: TextStyle(
                              color: Colors.red.shade800,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
