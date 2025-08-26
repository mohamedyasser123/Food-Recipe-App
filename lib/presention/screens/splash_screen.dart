import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rec_app/core/constants/app_colors.dart';
import 'package:rec_app/core/constants/app_images.dart';
import 'package:rec_app/core/constants/app_text_style.dart';
import 'package:rec_app/core/extensions/size_extensions.dart';
import 'package:rec_app/core/routes/app_routes.dart';
import 'package:rec_app/widgets/app_button.dart';
class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
       children: [
         Positioned.fill(child: Image.asset(AppImages.splash,fit: BoxFit.cover,)),
         Center(
           child: Column(
             children: [
               150.h.heightSizedBox,
               Text("100K+ Premium Recipe",
               style: AppTextStyle.mediumBold.copyWith(color: AppColors.white),
               ),
               Spacer(),
               SizedBox(
                 width: 120.w,
                 child: Text("Get Cooking",
                 textAlign: TextAlign.center,
                 style: AppTextStyle.headerBold.copyWith(color: AppColors.white),
                 ),
               ),
               16.h.heightSizedBox,
               Text("Simple way to find Tasty Recipe",
               style: AppTextStyle.normalRegular.copyWith(color: AppColors.white),
               ),
               24.h.heightSizedBox,
               Padding(
                 padding: const EdgeInsets.symmetric(horizontal: 30),
                 child: AppButton(
                   text: "Start Cooking",
                   size: AppButtonSize.big,
                   state: AppButtonState.defult,
                   withIcon: true,
                   onPressed: ()=>Navigator.pushNamed(context, AppRoutes.loginScreen ),
                 ),
               ),
               70.h.heightSizedBox,

             ],
           ),
         )


       ],
      )
    );
  }
}
