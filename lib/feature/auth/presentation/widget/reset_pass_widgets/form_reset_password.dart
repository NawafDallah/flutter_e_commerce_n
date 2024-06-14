import 'package:flutter_e_commerce_n_1/common/utils/extensions/translate_x_extension.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../common/utils/constants/sizes.dart';
import '../../../../../common/utils/functions/functions.dart';
import '../../../../../common/widgets/responsive.dart';
import '../../../../../config/routes/routes.dart';
import '../../bloc/auth_bloc/auth_bloc_bloc.dart';
import '../../bloc/password_visibility/password_visibilty.dart';
import 'confirm_pass_reset.dart';
import 'new_pass_reset.dart';

class FormResetPassword extends StatefulWidget {
  const FormResetPassword({
    super.key,
    required this.email,
  });

  final String email;

  @override
  State<FormResetPassword> createState() => _FormResetPasswordState();
}

class _FormResetPasswordState extends State<FormResetPassword> {
  late final TextEditingController newPasswordController;
  late final TextEditingController passwordConfirmController;
  late final GlobalKey<FormState> formKey;

  @override
  void initState() {
    newPasswordController = TextEditingController();
    passwordConfirmController = TextEditingController();
    formKey = GlobalKey<FormState>();
    super.initState();
  }

  @override
  void dispose() {
    newPasswordController.dispose();
    passwordConfirmController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final isTablet = Responsive.isTablet(context);
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => ResetPassVisibilityCubit(),
        ),
        BlocProvider(
          create: (context) => ConfirmPassVisibilityCubit(),
        ),
      ],
      child: Form(
        key: formKey,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // NEW PASSWORD
            NewPassword(newPasswordController: newPasswordController),

            SizedBox(height: NSizes.spaceBtwInputFields.h),

            // RE-TYPE NEW PASSWORD
            ConfirmPassword(
              passwordConfirmController: passwordConfirmController,
            ),

            // space
            SizedBox(height: NSizes.spaceBtwSections.h),

            // SAVE NEW PASSWORD
            Center(
              child: SizedBox(
                width: isTablet
                    ? NFunctions.screenWidth(context) / 3
                    : NFunctions.screenWidth(context) / 1.5,
                child: ElevatedButton(
                  onPressed: () {
                    if (formKey.currentState!.validate()) {
                      context.read<AuthBloc>().add(
                            ResetPasswordEvent(
                              email: widget.email,
                              password: newPasswordController.text.trim(),
                              confirmPassword:
                                  passwordConfirmController.text.trim(),
                            ),
                          );
                    }
                  },
                  child: BlocConsumer<AuthBloc, AuthState>(
                    listenWhen: (previous, current) => previous != current,
                    listener: (context, state) {
                      if (state is AuthResetPassFailureState) {
                        NFunctions.showSnackBar(
                            context, state.error.tr(context));
                      }
                      if (state is AuthResetPassSuccessState) {
                        Navigator.of(context).pushNamedAndRemoveUntil(
                          Routes.login,
                          (route) => false,
                        );
                        NFunctions.showSnackBar(context,
                            "thePasswordHasBeenResetSuccessfully".tr(context));
                      }
                    },
                    builder: (context, state) {
                      if (state is AuthResetPassLoadingState) {
                        return const CupertinoActivityIndicator();
                      }
                      return Text("save".tr(context));
                    },
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
