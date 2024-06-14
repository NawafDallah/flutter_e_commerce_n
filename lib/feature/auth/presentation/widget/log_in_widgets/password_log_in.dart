
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_e_commerce_n_1/common/utils/extensions/translate_x_extension.dart';
import 'package:iconsax/iconsax.dart';
import '../../../../../common/utils/constants/colors.dart';
import '../../../../../common/utils/functions/functions.dart';
import '../../../../../common/utils/validators/validation.dart';
import '../../../../../common/widgets/responsive.dart';
import '../../bloc/password_visibility/password_visibilty.dart';

class LogInPassword extends StatelessWidget {
  const LogInPassword({
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
      child: BlocBuilder<LogInPassVisibilityCubit, bool>(
        builder: (context, state) {
          return TextFormField(
            validator: (value) {
              return NValidator.validateIsEmpty(value, context);
            },
            textDirection: TextDirection.ltr,
            obscureText: state,
            controller: passwordController,
            cursorColor: NColors.primary,
            keyboardType: TextInputType.visiblePassword,
            decoration: InputDecoration(
              prefixIcon: const Icon(Iconsax.password_check),
              suffixIcon: IconButton(
                onPressed: () {
                  context.read<LogInPassVisibilityCubit>().toggleVisibility();
                },
                icon: Icon(state? Iconsax.eye_slash: Iconsax.eye),
              ),
              labelText: "password".tr(context),
            ),
          );
        },
      ),
    );
  }
}
