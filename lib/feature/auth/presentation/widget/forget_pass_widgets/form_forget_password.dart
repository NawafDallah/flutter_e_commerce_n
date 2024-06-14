import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../common/utils/constants/sizes.dart';
import 'email_forget_pass.dart';
import 'send_button_forget_pass.dart';

class FormForgetPassword extends StatefulWidget {
  const FormForgetPassword({super.key});

  @override
  State<FormForgetPassword> createState() => _FormForgetPasswordState();
}

class _FormForgetPasswordState extends State<FormForgetPassword> {
  late final TextEditingController emailController;
  late final GlobalKey<FormState> formKey;

  @override
  void initState() {
    emailController = TextEditingController();
    formKey = GlobalKey<FormState>();
    super.initState();
  }

  @override
  void dispose() {
    emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // EMAIL
          ForgetPassEmail(emailController: emailController),

          // space
          SizedBox(height: NSizes.spaceBtwSections.h),

          // SEND BUTTON
          ForgetPassSendButton(
            emailController: emailController,
            formKey: formKey,
          ),
        ],
      ),
    );
  }
}
