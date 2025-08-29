import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rec_app/core/constants/app_colors.dart';
import 'package:rec_app/core/constants/app_text_style.dart';
import 'package:rec_app/core/extensions/size_extensions.dart';
import 'package:rec_app/widgets/app_text_field.dart';

import '../../core/routes/app_routes.dart';
import '../../widgets/app_button.dart';
import 'login_screen.dart';

class CreateAccountScreen extends StatefulWidget {
   const CreateAccountScreen({super.key});

  @override
  State<CreateAccountScreen> createState() => _CreateAccountScreenState();
}

class _CreateAccountScreenState extends State<CreateAccountScreen> {
  final TextEditingController emailController=TextEditingController();

  final TextEditingController passwordController=TextEditingController();

  final TextEditingController nameController=TextEditingController();

  @override
  Widget build(BuildContext context) {
    bool value=false;
    return Scaffold(
      body: Padding(padding: EdgeInsets.symmetric(horizontal: 24.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Create an account",
            style: AppTextStyle.largeBold,
            ),
            SizedBox(
              width: 185.w,
              child: Text("Let’s help you set up your account, it won’t take long.",
              style: AppTextStyle.smallerRegular,
              ),
            ),
            AppTextField(
                label: "Name",
              keyboardType: TextInputType.name,
              hint: "Enter Name",
              controller: nameController,
            ),
            16.h.heightSizedBox,
            AppTextField(
              label: "Email",
              keyboardType: TextInputType.name,
              hint: "Enter Email",
              controller: emailController,
            ),
            16.h.heightSizedBox,
            AppTextField(
              label: "Password",
              keyboardType: TextInputType.name,
              hint: "Enter Password",
              controller: passwordController,
            ),
            16.h.heightSizedBox,
            AppTextField(
              label: "Confirm Password",
              keyboardType: TextInputType.name,
              hint: "Enter Name",
              controller: passwordController,
            ),
            16.h.heightSizedBox,
            checkBoxWidget(value),
            16.h.heightSizedBox,
            AppButton(
              text: "Sign In",
              onPressed: ()=>Navigator.pushNamed(context,AppRoutes.loginScreen),
              withIcon: true,
              state: AppButtonState.defult,
              size: AppButtonSize.big,
            ),
            16.h.heightSizedBox,
            DividerWithText(text:"Or Sign in With"),
            20.h.heightSizedBox,
            SocialWidget(),
            48.h.heightSizedBox,
            SignUpWidget(text: "Sign In",
            onTab: ()=>Navigator.pushNamed(
              context,
              AppRoutes.loginScreen,
            ),
            ),
        ],
      ),
      ),
    );
  }

  Widget checkBoxWidget(bool value){
    return Padding(
      padding:  EdgeInsets.symmetric(horizontal: 12.w),
      child: Row(
        spacing: 4.w,
        children: [
          GestureDetector(
            onTap: () {
              setState(() {
                value = !value;
              });
            },
            child: Container(
              height: 20.h,
              width: 20.w,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(4.r),
                border: Border.all(
                  color: AppColors.secondary100,
                  width: 2,
                ),
              ),
              child: value
                  ? Icon(
                Icons.check,
                size: 16.sp,
                color: AppColors.secondary100,
              )
                  : null,
            ),
          ),
          Text("Accept terms & Condition",
          style: AppTextStyle.smallerRegular.copyWith(color: AppColors.secondary100),)
        ],
      ),
    );
  }
}
