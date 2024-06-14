import 'package:flutter/material.dart';
import 'package:flutter_e_commerce_n_1/common/utils/extensions/translate_x_extension.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../common/utils/constants/image_strings.dart';
import '../../../../common/utils/constants/sizes.dart';
import '../../../../common/widgets/divider_auth.dart';
import '../../../../common/widgets/responsive.dart';
import '../../../../common/widgets/footer_auth.dart';
import '../widget/sign_up_widgets/form_signup.dart';

class Signup extends StatelessWidget {
  const Signup({super.key});

  @override
  Widget build(BuildContext context) {
    final isTablet = Responsive.isTablet(context);
    final isSmallMobile = Responsive.isSmallMobile(context);
    return Scaffold(
        resizeToAvoidBottomInset: false,
        body: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: 14.0.w,
            vertical: isTablet ? NSizes.xl : NSizes.xs,
          ),
          child: ListView(
            physics: const BouncingScrollPhysics(
              parent: AlwaysScrollableScrollPhysics(),
            ),
            children: [
              // CLOSE PAGE
              const CloseButton(
                style: ButtonStyle(
                  iconSize: WidgetStatePropertyAll(32),
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

              // TITLE
              Text(
                "signupTitle".tr(context),
                style: isSmallMobile
                    ? Theme.of(context).textTheme.headlineSmall
                    : Theme.of(context).textTheme.headlineMedium,
              ),

              // SPACE
              SizedBox(
                height: isSmallMobile ? NSizes.md : NSizes.spaceBtwSections.h,
              ),

              // FORM FIELD
              const FormSignup(),

              // DIVIDER
              const DividerAuth(text: "orSignUpWith"),

              // SPACE
              SizedBox(
                height: isSmallMobile ? NSizes.sm : NSizes.spaceBtwItems.h,
              ),

              // Footer
              const FooterAuth(),
            ],
          ),
        ));
  }
}
