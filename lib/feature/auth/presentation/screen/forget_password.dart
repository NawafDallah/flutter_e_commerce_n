import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../common/utils/constants/image_strings.dart';
import '../../../../common/utils/constants/sizes.dart';
import '../../../../common/widgets/responsive.dart';
import '../widget/forget_pass_widgets/form_forget_password.dart';
import '../widget/header_auth.dart';

class ForgetPassword extends StatelessWidget {
  const ForgetPassword({super.key});

  @override
  Widget build(BuildContext context) {
    final isTablet = Responsive.isTablet(context);
    return Scaffold(
        resizeToAvoidBottomInset: false,
        body: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: 14.0.w,
            vertical: isTablet ? NSizes.xl : NSizes.xs,
          ),
          child: ListView(
            physics: const NeverScrollableScrollPhysics(),
            children: [
              // CLOSE PAGE
              const CloseButton(
                style: ButtonStyle(
                  iconSize: WidgetStatePropertyAll (32.0),
                  alignment: AlignmentDirectional(-1.0, 0.0),
                ),
              ),

              // SPACE
              if (isTablet) const SizedBox(height: NSizes.md),

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
                title: "forgetPasswordTitle",
                subTitle: "forgetPasswordSubTitle",
              ),

              // SPACE
              SizedBox(height: NSizes.spaceBtwSections.h),

              // FORM FIELD
              const FormForgetPassword(),
            ],
          ),
        ));
  }
}
