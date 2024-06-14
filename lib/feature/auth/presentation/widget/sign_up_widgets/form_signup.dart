import 'package:flutter_e_commerce_n_1/common/utils/extensions/parse_to_int.dart';
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
import 'email_sign_up.dart';
import 'password_sign_up.dart';
import 'phone_sign_up.dart';
import 'user_name_sign_up.dart';

class FormSignup extends StatefulWidget {
  const FormSignup({super.key});

  @override
  State<FormSignup> createState() => _FormSignupState();
}

class _FormSignupState extends State<FormSignup> {
  late final TextEditingController userNameController;
  late final TextEditingController emailController;
  late final TextEditingController phoneController;
  late final TextEditingController passwordController;
  late final GlobalKey<FormState> formKey;
  String emailErrorMessage = '';
  String phoneErrorMessage = '';

  void errorMessageCheck(AuthSignUpFailureState state) {
    if (state.error.contains('emailExist')) {
      emailErrorMessage = state.error;
      phoneErrorMessage = '';
    } else if (state.error.contains('phoneExist')) {
      phoneErrorMessage = state.error;
      emailErrorMessage = '';
    }
  }

  @override
  void initState() {
    userNameController = TextEditingController();
    emailController = TextEditingController();
    phoneController = TextEditingController();
    passwordController = TextEditingController();
    formKey = GlobalKey<FormState>();
    super.initState();
  }

  @override
  void dispose() {
    userNameController.dispose();
    emailController.dispose();
    phoneController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final isTablet = Responsive.isTablet(context);
    return BlocProvider(
      create: (context) => SignUpPassVisibilityCubit(),
      child: BlocConsumer<AuthBloc, AuthState>(
        listener: (context, state) {
          if (state is AuthSignUpSuccessState) {
            Navigator.of(context).pushNamed(
              Routes.verifyCode,
              arguments: {
                'email': emailController.text.trim(),
                'previousPage': Routes.signup,
                'userData': null,
              },
            );
          }
          if (state is AuthSignUpFailureState) {
            errorMessageCheck(state);
            NFunctions.showSnackBar(context, state.error.tr(context));
          }
        },
        builder: (context, state) {
          return Form(
            key: formKey,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // USER NAME
                UserName(userNameController: userNameController),

                // space between fields
                SizedBox(height: NSizes.spaceBtwInputFields.h),

                // EMAIL
                Email(
                  emailController: emailController,
                  emailErrorMessage: emailErrorMessage,
                ),

                // space between fields
                SizedBox(height: NSizes.spaceBtwInputFields.h),

                // PHONE
                Phone(
                  phoneController: phoneController,
                  phoneErrorMessage: phoneErrorMessage,
                ),

                // space between fields
                SizedBox(height: NSizes.spaceBtwInputFields.h),

                // PASSWORD
                Password(passwordController: passwordController),

                // space
                SizedBox(height: NSizes.spaceBtwSections.h),

                // CREATE ACCOUNT BUTTON
                Center(
                  child: SizedBox(
                    width: isTablet
                        ? NFunctions.screenWidth(context) / 3
                        : NFunctions.screenWidth(context) / 1.5,
                    child: ElevatedButton(
                      onPressed: () {
                        if (formKey.currentState!.validate()) {
                          context.read<AuthBloc>().add(
                                SignUpEvent(
                                  name: userNameController.text.trim(),
                                  email: emailController.text.trim(),
                                  phone: phoneController.text.trim().toInt(),
                                  password: passwordController.text.trim(),
                                ),
                              );
                        }
                      },
                      child: state is AuthSignUpLoadingState
                          ? const CupertinoActivityIndicator()
                          : Text("createAccount".tr(context)),
                    ),
                  ),
                ),
                SizedBox(height: NSizes.spaceBtwSections.h),
              ],
            ),
          );
        },
      ),
    );
  }
}
