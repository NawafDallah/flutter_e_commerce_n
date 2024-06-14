import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';

import '../../../../../common/utils/constants/colors.dart';
import '../../../../../common/utils/functions/functions.dart';
import '../../../../../common/widgets/responsive.dart';
import '../../bloc/auth_bloc/auth_bloc_bloc.dart';

class OtpFields extends StatelessWidget {
  const OtpFields({
    super.key,
    required this.email,
  });

  final String email;

  @override
  Widget build(BuildContext context) {
    final isTablet = Responsive.isTablet(context);
    final isDark = NFunctions.isDarkMode(context);
    return Directionality(
      textDirection: TextDirection.ltr,
      child: BlocBuilder<AuthBloc, AuthState>(
        builder: (context, state) {
          return OtpTextField(
            numberOfFields: 5,
            fieldWidth: isTablet ? 100.0 : 50.0,
            textStyle: isTablet
                ? Theme.of(context).textTheme.headlineLarge
                : Theme.of(context).textTheme.headlineMedium,
            cursorColor: isDark ? NColors.light : NColors.dark,
            fillColor: NColors.primary,
            focusedBorderColor: NColors.primary,
            showFieldAsBox: false,
            enabledBorderColor: state is AuthVerifyCodeFailureState
                ? NColors.error
                : const Color(0xFFE7E7E7),
            onSubmit: (String verificationCode) {
              context.read<AuthBloc>().add(VerifyCodeEvent(
                    verificationCode: verificationCode,
                    email: email,
                  ));
            }, // end onSubmit
          );
        },
      ),
    );
  }
}
