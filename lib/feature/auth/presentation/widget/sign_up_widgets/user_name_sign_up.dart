import 'package:flutter_e_commerce_n_1/common/utils/extensions/translate_x_extension.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../../common/utils/constants/colors.dart';
import '../../../../../common/utils/functions/functions.dart';
import '../../../../../common/utils/validators/validation.dart';
import '../../../../../common/widgets/responsive.dart';

class UserName extends StatelessWidget {
  const UserName({
    super.key,
    required this.userNameController,
  });

  final TextEditingController userNameController;

  @override
  Widget build(BuildContext context) {
    final isTablet = Responsive.isTablet(context);
    return SizedBox(
      width: isTablet
          ? NFunctions.screenWidth(context) * 1 / 1.5
          : NFunctions.screenWidth(context),
      child: TextFormField(
        validator: (value) => NValidator.validateUserName(value, context),
        controller: userNameController,
        cursorColor: NColors.primary,
        keyboardType: TextInputType.name,
        decoration: InputDecoration(
          prefixIcon: const Icon(Iconsax.user),
          labelText: "username".tr(context),
        ),
      ),
    );
  }
}
