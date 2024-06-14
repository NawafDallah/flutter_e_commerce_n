import 'package:flutter_e_commerce_n_1/common/utils/extensions/translate_x_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconsax/iconsax.dart';
import '../../../../../common/utils/constants/colors.dart';
import '../../../../../common/utils/functions/functions.dart';
import '../../../../../common/utils/validators/validation.dart';
import '../../../../../common/widgets/responsive.dart';
import '../../bloc/password_visibility/password_visibilty.dart';

class Password extends StatelessWidget {
  const Password({
    super.key,
    required this.passwordController,
  });

  final TextEditingController passwordController;

  @override
  Widget build(BuildContext context) {
    final isTablet = Responsive.isTablet(context);
    return SizedBox(
      width: isTablet
          ? NFunctions.screenWidth(context) * 1 / 1.5
          : NFunctions.screenWidth(context),
      child: BlocBuilder<SignUpPassVisibilityCubit, bool>(
        builder: (context, state) {
          return TextFormField(
            validator: (value) => NValidator.validatePassword(value, context),
            controller: passwordController,
            textDirection: TextDirection.ltr,
            cursorColor: NColors.primary,
            keyboardType: TextInputType.visiblePassword,
            obscureText: state,
            decoration: InputDecoration(
              prefixIcon: const Icon(Iconsax.password_check),
              suffixIcon: IconButton(
                onPressed: () => context
                    .read<SignUpPassVisibilityCubit>()
                    .toggleVisibility(),
                icon: Icon(state ? Iconsax.eye_slash : Iconsax.eye),
              ),
              labelText: "password".tr(context),
            ),
          );
        },
      ),
    );
  }
}
