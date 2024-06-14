import 'package:flutter_e_commerce_n_1/common/utils/extensions/translate_x_extension.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import '../../../../../common/utils/constants/colors.dart';
import '../../../../../common/utils/functions/functions.dart';
import '../../../../../common/utils/validators/validation.dart';
import '../../../../../common/widgets/responsive.dart';

class Phone extends StatelessWidget {
  const Phone({
    super.key,
    required this.phoneController,
    required this.phoneErrorMessage,
  });

  final TextEditingController phoneController;
  final String phoneErrorMessage;

  @override
  Widget build(BuildContext context) {
    final isTablet = Responsive.isTablet(context);
    return SizedBox(
      width: isTablet
          ? NFunctions.screenWidth(context) * 1 / 1.5
          : NFunctions.screenWidth(context),
      child: TextFormField(
        validator: (value) => NValidator.validatePhoneNumber(value, context),
        controller: phoneController,
        textDirection: TextDirection.ltr,
        cursorColor: NColors.primary,
        keyboardType: TextInputType.phone,
        decoration: InputDecoration(
            prefixIcon: const Icon(Iconsax.call),
            labelText: "phoneNo".tr(context),
            helperText: phoneErrorMessage.isNotEmpty
                ? phoneErrorMessage.tr(context)
                : null,
            hintText: "05XXXXXXXX",
            hintStyle: Theme.of(context).textTheme.labelMedium),
      ),
    );
  }
}
