import 'package:flutter_e_commerce_n_1/common/utils/extensions/translate_x_extension.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../bloc/auth_bloc/auth_bloc_bloc.dart';
import '../../bloc/timer/timer_cubit.dart';

class ResendButton extends StatelessWidget {
  const ResendButton({
    super.key,
    required this.email,
  });

  final String email;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Builder(
        builder: (context) {
          final authState = context.watch<AuthBloc>().state;
          final timeState = context.watch<TimerCubit>().state;
          return TextButton(
            onPressed: timeState == 0
                ? () {
                    context
                        .read<AuthBloc>()
                        .add(ResendVerifyCodeEvent(email: email));
                    context.read<TimerCubit>().startTimer();
                  }
                : null,
            child: authState is AuthVerifyCodeLoadingState
                ? const CupertinoActivityIndicator()
                : Text("resendEmail".tr(context)),
          );
        },
      ),
    );
  }
}
