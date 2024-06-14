
import 'package:flutter/material.dart';
import 'package:flutter_e_commerce_n_1/common/utils/extensions/translate_x_extension.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../../common/utils/constants/colors.dart';
import '../../../../../common/utils/functions/functions.dart';
import '../../../../../common/utils/validators/validation.dart';
import '../../../../../common/widgets/responsive.dart';

class ForgetPassEmail extends StatelessWidget {
  const ForgetPassEmail({
    super.key,
    required this.emailController,
  });

  final TextEditingController emailController;

  @override
  Widget build(BuildContext context) {
    final isTablet = Responsive.isTablet(context);
    return SizedBox(
      width: isTablet
          ? NFunctions.screenWidth(context) * 1 / 1.5
          : NFunctions.screenWidth(context),
      child: TextFormField(
        controller: emailController,
        textDirection: TextDirection.ltr,
        validator: (value) => NValidator.validateEmail(value, context),
        cursorColor: NColors.primary,
        keyboardType: TextInputType.emailAddress,
        decoration: InputDecoration(
          prefixIcon: const Icon(Iconsax.direct),
          labelText: "email".tr(context),
          hintText: "example@mail.com",
          hintStyle: Theme.of(context).textTheme.labelMedium,
        ),
      ),
    );
  }
}
