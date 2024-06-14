import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_e_commerce_n_1/common/utils/extensions/translate_x_extension.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive_flutter/hive_flutter.dart';
import '../../../../common/utils/constants/image_strings.dart';
import '../../../../common/utils/constants/sizes.dart';
import '../../../../common/utils/functions/functions.dart';
import '../../../../common/widgets/responsive.dart';
import '../../../../config/routes/routes.dart';
import '../../../../core/cubits/middleware/middleware_cubit.dart';
import '../../../../init_dependencies.dart';
import '../bloc/auth_bloc/auth_bloc_bloc.dart';
import '../bloc/timer/timer_cubit.dart';
import '../widget/header_auth.dart';
import '../widget/verify_code_widgets/otp_fileds_verify_code.dart';
import '../widget/verify_code_widgets/resend_button_verify_code.dart';

class VerificationCode extends StatelessWidget {
  final String previousPage;
  final String email;
  final Map<String, Object?>? userData;

  const VerificationCode({
    super.key,
    this.userData,
    required this.previousPage,
    required this.email,
  });

  void previousPageCheck(BuildContext context) {
    if (previousPage == Routes.forgetPassword) {
      Navigator.of(context).pushNamed(Routes.resetPassword, arguments: email);
    } else if (previousPage == Routes.login) {
      context.read<MiddlewareCubit>().changeMiddleWarePage(Routes.home);
      sl<Box>().put("currentUser", userData);
      Navigator.of(context).pushNamedAndRemoveUntil(
        Routes.home,
        (route) => false,
      );
    } else {
      Navigator.of(context).pushNamedAndRemoveUntil(
        Routes.login,
        (route) => false,
      );
      NFunctions.showSnackBar(
          context, "yourAccountHasBeenCreatedSuccessfully".tr(context));
    }
  }

  @override
  Widget build(BuildContext context) {
    final isTablet = Responsive.isTablet(context);
    return BlocProvider(
      create: (context) => TimerCubit()..startTimer(),
      child: PopScope(
        canPop: false,
        child: Scaffold(
          body: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 14.0,
              vertical: NSizes.xl,
            ),
            child: BlocListener<AuthBloc, AuthState>(
              listener: (context, state) {
                if (state is AuthVerifyCodeSuccessState) {
                  context.read<TimerCubit>().stopTimer();
                  previousPageCheck(context);
                }
                if (state is AuthResendCodeSuccessState) {
                  NFunctions.showSnackBar(
                    context,
                    "verificationCodeSent".tr(context),
                  );
                }
                if (state is AuthVerifyCodeFailureState) {
                  NFunctions.showSnackBar(context, state.error.tr(context));
                }
              },
              child: ListView(
                physics: const NeverScrollableScrollPhysics(),
                children: [
                  // SPACE
                  const SizedBox(height: NSizes.md),

                  CloseButton(
                    style: const ButtonStyle(
                      iconSize: WidgetStatePropertyAll(32),
                      alignment: AlignmentDirectional(-1.0, 0.0),
                    ),
                    onPressed: () =>
                        Navigator.of(context).pushNamedAndRemoveUntil(
                      Routes.login,
                      (route) => false,
                    ),
                  ),

                  if (isTablet)
                    const Image(
                      alignment: AlignmentDirectional(-1.0, 0.0),
                      image: AssetImage(NImages.appLogo),
                      width: 100,
                      height: 150,
                    ),

                  // SPACE
                  if (isTablet) const SizedBox(height: NSizes.md),

                  // TITLE & SUB-TITLE
                  const HeaderAuth(
                    title: "verificationCodetitle",
                    subTitle: "verificationCodeSubtitle",
                  ),

                  // EMAIL IN DATABASE
                  Text(
                    "\n$email",
                    style: Theme.of(context)
                        .textTheme
                        .labelLarge!
                        .copyWith(fontSize: isTablet ? 24 : 16),
                  ),

                  // SPACE
                  SizedBox(height: NSizes.spaceBtwSections.h),

                  // OTP FIELD
                  OtpFields(email: email),

                  // SPACE
                  const SizedBox(height: NSizes.md),

                  // TIMER
                  Center(
                    child: BlocBuilder<TimerCubit, int>(
                      builder: (context, timerState) {
                        return Text(
                          "00:${timerState.toString().padLeft(2, '0')}",
                          style: Theme.of(context).textTheme.headlineSmall,
                        );
                      },
                    ),
                  ),

                  // SPACE
                  const SizedBox(height: NSizes.xl),

                  Center(
                      child:
                          Text("don'tReseaveTheVerificationCode".tr(context))),

                  // RESEND BUTTON
                  ResendButton(email: email),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
