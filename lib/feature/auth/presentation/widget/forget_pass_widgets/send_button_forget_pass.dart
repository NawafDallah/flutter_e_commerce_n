import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_e_commerce_n_1/common/utils/extensions/translate_x_extension.dart';

import '../../../../../common/utils/functions/functions.dart';
import '../../../../../common/widgets/responsive.dart';
import '../../../../../config/routes/routes.dart';
import '../../bloc/auth_bloc/auth_bloc_bloc.dart';

class ForgetPassSendButton extends StatelessWidget {
  const ForgetPassSendButton({
    super.key,
    required this.emailController,
    required this.formKey,
  });

  final TextEditingController emailController;
  final GlobalKey<FormState> formKey;

  @override
  Widget build(BuildContext context) {
    final isTablet = Responsive.isTablet(context);
    return Center(
      child: SizedBox(
        width: isTablet
            ? NFunctions.screenWidth(context) / 3
            : NFunctions.screenWidth(context) / 1.5,
        child: BlocConsumer<AuthBloc, AuthState>(
          listenWhen: (previous, current) => previous != current,
          listener: (context, state) {
            if (state is AuthForgetPassFailureState) {
              NFunctions.showSnackBar(context, state.error.tr(context));
            }
            if (state is AuthForgetPassSuccessState) {
              Navigator.of(context).pushNamed(
                Routes.verifyCode,
                arguments: {
                  'email': emailController.text.trim(),
                  'previousPage': Routes.forgetPassword,
                  'userData': null,
                },
              );
            }
          },
          builder: (context, state) {
            return ElevatedButton(
              onPressed: () {
                if (formKey.currentState!.validate()) {
                  context.read<AuthBloc>().add(
                        ForgetPasswordEvent(
                          email: emailController.text.trim(),
                        ),
                      );
                }
              },
              child: state is AuthForgetPassLoadingState
                  ? const CupertinoActivityIndicator()
                  : Text("send".tr(context)),
            );
          },
        ),
      ),
    );
  }
}
