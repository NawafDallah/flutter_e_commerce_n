import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_e_commerce_n_1/common/utils/extensions/translate_x_extension.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive_flutter/hive_flutter.dart';
import '../../../../../common/utils/constants/sizes.dart';
import '../../../../../common/utils/functions/functions.dart';
import '../../../../../common/widgets/responsive.dart';
import '../../../../../config/routes/routes.dart';
import '../../../../../core/cubits/middleware/middleware_cubit.dart';
import '../../../../../init_dependencies.dart';
import '../../bloc/auth_bloc/auth_bloc_bloc.dart';
import '../../bloc/password_visibility/password_visibilty.dart';
import 'email_log_in.dart';
import 'password_log_in.dart';

class FormLogin extends StatefulWidget {
  const FormLogin({super.key});

  @override
  State<FormLogin> createState() => _FormLoginState();
}

class _FormLoginState extends State<FormLogin> {
  late final TextEditingController emailController;
  late final TextEditingController passwordController;
  late final GlobalKey<FormState> formKey;

  @override
  void initState() {
    emailController = TextEditingController();
    passwordController = TextEditingController();
    formKey = GlobalKey<FormState>();
    super.initState();
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  void isUserVerified(AuthLogInSuccessState state, BuildContext context) {
    final userData = {
      "userId": state.user.userId,
      "userEmail": state.user.userEmail,
      "userPhone": state.user.userPhone,
      "userName": state.user.userName,
    };
    if (state.user.userApproved == 0) {
      Navigator.of(context).pushNamed(
        Routes.verifyCode,
        arguments: {
          'email': emailController.text.trim(),
          'previousPage': Routes.login,
          'userData': userData,
        },
      );
    } else {
      context
          .read<MiddlewareCubit>()
          .changeMiddleWarePage(Routes.navigationBar);
      sl<Box>().put("currentUser", userData);
      Navigator.of(context).pushNamedAndRemoveUntil(
        Routes.navigationBar,
        (route) => false,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final isSmallMobile = Responsive.isSmallMobile(context);
    final isTablet = Responsive.isTablet(context);
    return BlocProvider(
      create: (context) => LogInPassVisibilityCubit(),
      child: Form(
        key: formKey,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // EMAIL
            LoginEmail(emailController: emailController),

            SizedBox(height: NSizes.spaceBtwInputFields.h),

            // PASSWORD
            LogInPassword(passwordController: passwordController),

            // FORGET PASSWORD
            Align(
              alignment: AlignmentDirectional(isTablet ? -1.0 : 1.0, 0.0),
              child: TextButton(
                onPressed: () {
                  Navigator.of(context).pushNamed(Routes.forgetPassword);
                },
                child: Text(
                  "forgetPassword".tr(context),
                  style: isTablet
                      ? Theme.of(context)
                          .textTheme
                          .bodySmall!
                          .copyWith(fontSize: 20)
                      : Theme.of(context).textTheme.bodySmall,
                ),
              ),
            ),

            SizedBox(
              height: isTablet
                  ? NSizes.spaceBtwSections.h
                  : isSmallMobile
                      ? NSizes.xs
                      : NSizes.spaceBtwItems.h,
            ),

            // Log-in & Create-Account
            Center(
              child: Column(
                children: [
                  // LOG-in Button
                  SizedBox(
                    width: isTablet
                        ? NFunctions.screenWidth(context) / 3
                        : NFunctions.screenWidth(context) / 1.5,
                    child: BlocConsumer<AuthBloc, AuthState>(
                      listener: (context, state) {
                        if (state is AuthLogInFailureState) {
                          NFunctions.showSnackBar(
                              context, state.error.tr(context));
                        }
                        if (state is AuthLogInSuccessState) {
                          isUserVerified(state, context);
                        }
                      },
                      builder: (context, state) {
                        return ElevatedButton(
                          onPressed: () {
                            if (formKey.currentState!.validate()) {
                              context.read<AuthBloc>().add(
                                    LogInEvent(
                                      email: emailController.text.trim(),
                                      password: passwordController.text.trim(),
                                    ),
                                  );
                            }
                          },
                          child: state is AuthLogInLoadingState
                              ? const CupertinoActivityIndicator()
                              : Text("logIn".tr(context)),
                        );
                      },
                    ),
                  ),

                  SizedBox(
                    height: isSmallMobile ? NSizes.sm : NSizes.spaceBtwItems.h,
                  ),

                  // Create acount Button
                  SizedBox(
                    width: isTablet
                        ? NFunctions.screenWidth(context) / 3
                        : NFunctions.screenWidth(context) / 1.5,
                    child: OutlinedButton(
                      onPressed: () {
                        Navigator.of(context).pushNamed(Routes.signup);
                      },
                      child: Text("createAccount".tr(context)),
                    ),
                  ),

                  SizedBox(
                    height:
                        isSmallMobile ? NSizes.sm : NSizes.spaceBtwSections.h,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
