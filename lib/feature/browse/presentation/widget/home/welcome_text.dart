import 'package:flutter_e_commerce_n_1/common/utils/extensions/translate_x_extension.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

import '../../../../../common/widgets/responsive.dart';
import '../../../../../init_dependencies.dart';

class WelcomeTexts extends StatelessWidget {
  const WelcomeTexts({super.key});

  @override
  Widget build(BuildContext context) {
    final user = sl<Box>().get("currentUser");
    final isTablet = Responsive.isTablet(context);
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "homeAppbarTitle".tr(context),
            style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                  fontSize: isTablet ? 24.0 : null,
                ),
          ),
          RichText(
            text: TextSpan(
              text: "welcome".tr(context),
              style: Theme.of(context).textTheme.bodySmall!.copyWith(
                    fontSize: isTablet ? 24.0 : null,
                  ),
              children: [
                TextSpan(
                  text: ', ${user["userName"]}?',
                  style: Theme.of(context).textTheme.bodySmall!.copyWith(
                        fontWeight: FontWeight.bold,
                        fontSize: isTablet ? 24.0 : null,
                      ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
