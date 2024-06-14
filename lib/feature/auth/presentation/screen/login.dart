import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../common/utils/constants/image_strings.dart';
import '../../../../common/utils/constants/sizes.dart';
import '../../../../common/widgets/responsive.dart';
import '../../../../common/widgets/divider_auth.dart';
import '../../../../common/widgets/footer_auth.dart';
import '../widget/log_in_widgets/form_login.dart';
import '../widget/header_auth.dart';

class Login extends StatelessWidget {
  const Login({super.key});

  @override
  Widget build(BuildContext context) {
    final isTablet = Responsive.isTablet(context);
    final isSmallMobile = Responsive.isSmallMobile(context);
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
            physics: const BouncingScrollPhysics(
              parent: AlwaysScrollableScrollPhysics(),
            ),
            children: [
              // LOGO
              Image(
                image: const AssetImage(NImages.appLogo),
                alignment: const AlignmentDirectional(-1.0, 0.0),
                width: isSmallMobile ? 75 : 100,
                height: isSmallMobile ? 100 : 150,
              ),

              //TITLE & SUB-TITLE,
              const HeaderAuth(
                title: "loginTitle",
                subTitle: "loginSubTitle",
              ),

              // SPACE
              SizedBox(
                height: isSmallMobile ? NSizes.md : NSizes.spaceBtwSections.h,
              ),

              // FORM FIELD
              const FormLogin(),

              // DIVIDER
              const DividerAuth(text: "orSignInWith"),

              // SPACE
              SizedBox(
                height:
                    isSmallMobile ? NSizes.sm : NSizes.spaceBtwSections.h / 2,
              ),

              // Footer
              const FooterAuth(),
            ],
          ),
        ),
      ),
    );
  }
}
