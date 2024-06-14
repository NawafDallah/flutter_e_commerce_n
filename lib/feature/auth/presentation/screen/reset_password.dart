import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../common/utils/constants/image_strings.dart';
import '../../../../common/utils/constants/sizes.dart';
import '../../../../common/widgets/responsive.dart';
import '../../../../config/routes/routes.dart';
import '../widget/reset_pass_widgets/form_reset_password.dart';
import '../widget/header_auth.dart';

class ResetPassword extends StatelessWidget {
  final String email;
  const ResetPassword({
    super.key,
    required this.email,
  });

  @override
  Widget build(BuildContext context) {
    final isTablet = Responsive.isTablet(context);
    return PopScope(
      canPop: false,
      child: Scaffold(
          resizeToAvoidBottomInset: false,
          body: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 14.0.w,
              vertical: isTablet ? NSizes.xl : NSizes.xs,
            ),
            child: ListView(
              physics: const NeverScrollableScrollPhysics(),
              children: [
                // SPACE
                const SizedBox(height: NSizes.xl),
      
                CloseButton(
                  style: const ButtonStyle(
                    iconSize: WidgetStatePropertyAll(32),
                    alignment: AlignmentDirectional(-1.0, 0.0),
                  ),
                  onPressed: () => Navigator.of(context).pushNamedAndRemoveUntil(
                    Routes.login,
                    (route) => false,
                  ),
                ),
      
                if (isTablet)
                  const Image(
                    alignment: AlignmentDirectional(-1.0, 0.0),
                    image: AssetImage(NImages.appLogo),
                    width: 100,
                    height: 150,
                  ),
      
                // SPACE
                if (isTablet) const SizedBox(height: NSizes.md),
      
                // TITLE & SUB-TITLE
                const HeaderAuth(
                  title: "changeYourPasswordTitle",
                  subTitle: "changeYourPasswordSubTitle",
                ),
      
                // SPACE
                SizedBox(height: NSizes.spaceBtwSections.h),
      
                FormResetPassword(email: email)
              ],
            ),
          )),
    );
  }
}
