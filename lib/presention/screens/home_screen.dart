import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rec_app/core/constants/app_colors.dart';
import 'package:rec_app/core/constants/app_images.dart';
import 'package:rec_app/core/constants/app_text_style.dart';
import 'package:rec_app/core/extensions/size_extensions.dart';

import '../../widgets/search_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selectedIndex = 0;

  final List<String> filters = [
    "All",
    "Popular",
    "New",
    "Recommended",
    "Trending",
    "Favorites",
    "Recent",
    "Nearby",
    "Top Rated",
    "Discounts",
    "For You",
    "More"
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding:EdgeInsets.symmetric(horizontal: 24.w),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            homeAppBarWidget(),
            24.h.heightSizedBox,
            SearchWidget(),
            16.h.heightSizedBox,
            SizedBox(
                height: 40.h,
                child: filterWidget()),
          ],
        ),
      ),
    );
  }

  Widget homeAppBarWidget(){
    return Row(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Hello Jega",
              textAlign: TextAlign.start,
              style: AppTextStyle.largeBold,),
            Text("What are you cooking today?",style: AppTextStyle.smallerRegular.copyWith(color: AppColors.gray3),),
          ],
        ),
        Spacer(),
        Container(
            decoration: BoxDecoration(
              color: AppColors.secondary40,
              borderRadius: BorderRadius.circular(8.r)
            ),
            child: Image.asset(AppImages.me)),

      ],
    );
  }

  Widget filterWidget(){
    return ListView.builder(
      itemCount: filters.length,

      scrollDirection: Axis.horizontal,
      itemBuilder: (context, index) => filterItemWidget(
        text: filters[index],
        isSelected: selectedIndex == index,
        onTap: () {
          setState(() {
            selectedIndex = index;
          });
        },
    ),);
  }

  Widget filterItemWidget({String? text, required bool isSelected,required VoidCallback onTap}){
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 4.w),
        padding: EdgeInsets.symmetric(horizontal: 20.w,vertical: 8.h),
        decoration: BoxDecoration(
          color: isSelected?AppColors.primary100:Colors.transparent,
          borderRadius: BorderRadius.circular(10.r),
        ),
        child: Text(text??"data",
          textAlign: TextAlign.center,
          style: AppTextStyle.smallerBold.copyWith(color: isSelected ?AppColors.white:AppColors.primary100),

        ),
      ),
    );
  }
}
