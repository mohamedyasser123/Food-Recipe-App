import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rec_app/core/constants/app_colors.dart';
import 'package:rec_app/core/constants/app_images.dart';
import 'package:rec_app/core/constants/app_text_style.dart';
import 'package:rec_app/core/extensions/size_extensions.dart';
import 'package:rec_app/core/routes/app_routes.dart';
import 'package:rec_app/widgets/app_button.dart';

import '../../widgets/app_text_field.dart';

class LoginScreen extends StatelessWidget {
   LoginScreen({super.key});
final TextEditingController emailController=TextEditingController();
final TextEditingController passwordController=TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding:  EdgeInsets.symmetric(horizontal: 24.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Hello,",
            style: AppTextStyle.headerBold,
            ),
            Text("Welcome Back!",
              style: AppTextStyle.largeRegular,
            ),
            56.h.heightSizedBox,
            AppTextField(
              label: "Email",
              controller: emailController,
              hint: "Enter Email",
              keyboardType: TextInputType.emailAddress,
            ),
            24.h.heightSizedBox,
            AppTextField(
              label: "Enter Password",
              controller: passwordController,
              hint: "Enter Password",
              keyboardType: TextInputType.visiblePassword,
            ),
            16.h.heightSizedBox,
            GestureDetector(
              child: Text("Forgot Password?",
              style: AppTextStyle.smallerRegular.copyWith(color: AppColors.secondary100),
              ),
            ),
            24.h.heightSizedBox,
            AppButton(
              text: "Sign In",
              onPressed: ()=>Navigator.pushNamed(context,AppRoutes.homeScreen),
              withIcon: true,
              state: AppButtonState.defult,
              size: AppButtonSize.big,
            ),
            16.h.heightSizedBox,
            _dividerWithText("Or Sign in With"),
            20.h.heightSizedBox,
            socialWidget(),
            48.h.heightSizedBox,
            signUpWidget()
          ],
        ),
      ),
    );
  }
   Widget _dividerWithText(String text) {
     return Padding(
       padding:EdgeInsets.symmetric(horizontal: 32.w),
       child: Row(
         children: [
           Expanded(child: Divider(
               color: AppColors.gray4,
           )),
           Padding(
             padding: const EdgeInsets.symmetric(horizontal: 8.0),
             child: Text(text, style:AppTextStyle.smallerBold.copyWith(color: AppColors.gray4)),
           ),
           Expanded(child: Divider(color: AppColors.gray4)),
         ],
       ),
     );
   }
   Widget socialWidget(){
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      spacing: 24.w,
      children: [
        Container(
          padding: EdgeInsets.all(10.r),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.r),

              image: DecorationImage(image: AssetImage(AppImages.google))
          ),
        ),
        Container(
          padding: EdgeInsets.all(10.r),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.r),
              image: DecorationImage(image: AssetImage(AppImages.facebook))
          ),
        )
      ],
    );
   }
   Widget signUpWidget(){
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text("Don’t have an account?",
        style: AppTextStyle.smallerBold,
        ),
        GestureDetector(
          child: Text("  Sign up",
            style: AppTextStyle.smallerBold.copyWith(color: AppColors.secondary100),
          ),
        ),
      ],
    );
   }
}
