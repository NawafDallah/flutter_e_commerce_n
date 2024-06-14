import 'package:flutter_e_commerce_n_1/common/utils/extensions/translate_x_extension.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import '../../../../../common/utils/constants/colors.dart';
import '../../../../../common/utils/functions/functions.dart';
import '../../../../../common/utils/validators/validation.dart';
import '../../../../../common/widgets/responsive.dart';

class Email extends StatelessWidget {
  const Email({
    super.key,
    required this.emailController,
    required this.emailErrorMessage,
  });


  final TextEditingController emailController;
  final String emailErrorMessage;

  @override
  Widget build(BuildContext context) {
    final isTablet = Responsive.isTablet(context);
    return SizedBox(
      width: isTablet
          ? NFunctions.screenWidth(context) * 1 / 1.5
          : NFunctions.screenWidth(context),
      child: TextFormField(
        validator: (value) => NValidator.validateEmail(value, context),
        controller: emailController,
        textDirection: TextDirection.ltr,
        cursorColor: NColors.primary,
        keyboardType: TextInputType.emailAddress,
        decoration: InputDecoration(
          helperText: emailErrorMessage.isNotEmpty
              ? emailErrorMessage.tr(context)
              : null,
          prefixIcon: const Icon(Iconsax.direct),
          labelText: "email".tr(context),
          hintText: "example@mail.com",
          hintStyle: Theme.of(context).textTheme.labelMedium,
        ),
      ),
    );
  }
}
