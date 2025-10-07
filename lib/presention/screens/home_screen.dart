import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:rec_app/core/constants/app_colors.dart';
import 'package:rec_app/core/constants/app_images.dart';
import 'package:rec_app/core/constants/app_text_style.dart';
import 'package:rec_app/core/extensions/size_extensions.dart';
import '../../core/routes/app_routes.dart';
import '../../models/meals_response_model.dart';
import '../../providers/meal_provider.dart';
import '../../widgets/search_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selectedIndex = 0;
  int selectedAppBar = 0;
  @override
  void initState() {
    super.initState();
    Future.microtask(() {
      Provider.of<MealProvider>(context, listen: false).fetchRandomMeal();
      context.read<MealProvider>().fetchAreas();
    });

  }
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<MealProvider>(context);
    if (provider.isLoading) {
      return const Center(child: CircularProgressIndicator());
    }
    if (provider.error != null) {
      return Center(child: Text("Error: ${provider.error}"));
    }
    if (provider.mealsResponse == null || provider.mealsResponse!.meals.isEmpty) {
      return const Center(child: Text("No meals found"));
    }
    return Scaffold(
      body: Padding(
        padding:EdgeInsets.symmetric(horizontal: 24.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            homeAppBarWidget(),
            24.h.heightSizedBox,
            SearchWidget(
              onTab: ()=>Navigator.pushNamed(context,AppRoutes.searchRecipesScreen),
            ),
            16.h.heightSizedBox,
            SizedBox(
                height: 40.h,
                child: filterWidget()),
            54.h.heightSizedBox,
            SizedBox(
              height: 200.h,
              child: Consumer<MealProvider>(
                builder: (context, provider, child) {
                  final meals = selectedIndex == 0
                      ? provider.mealsResponse?.meals ?? []
                      : provider.mealsSummaryResponse?.mealsSummy ?? [];
                  return ListView.separated(
                    scrollDirection: Axis.horizontal,
                    itemCount: meals.length,
                    itemBuilder: (context, index) {
                      if (selectedIndex == 0) {
                        final meal = meals[index] as Meal;
                        return homeFoodWidget(
                          mealName: meal.strMeal,
                          mealImage: meal.strMealThumb,
                        );
                      } else {
                        final mealSummary = meals[index] as MealSummary;
                        return homeFoodWidget(
                          mealName: mealSummary.strMeal,
                          mealImage: mealSummary.strMealThumb,
                        );
                      }
                    },
                    separatorBuilder: (context, index) => 8.w.widthSizedBox,
                  );
                },
              ),
            ),
            Text("New Recipes",style: AppTextStyle.normalBold,),
            24.h.heightSizedBox,
            newRecipesWidget(),

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
  Widget filterWidget() {
    return Consumer<MealProvider>(
      builder: (context, provider, child) {
        final filters = ["All", ...provider.areas];
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
              final selectedArea = filters[index];
              if (selectedArea.toLowerCase() == "all") {
                context.read<MealProvider>().fetchRandomMeal();
              } else {
                context.read<MealProvider>().getMealsByArea(selectedArea);
              }
            },
          ),
        );
      },
    );
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
  Widget homeFoodWidget({String?mealName, String?mealImage}) {
    return Column(
      children: [
        Stack(
          alignment: Alignment.center,
          clipBehavior: Clip.none,
          children: [
            Container(
              width: 150.w,
              padding: EdgeInsets.all(10.r),
              decoration: BoxDecoration(
                color: AppColors.gray4.withValues(alpha: .5),
                borderRadius: BorderRadius.circular(12.r),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  60.h.heightSizedBox,
                  Center(
                    child: SizedBox(
                      width: 130.w,
                      child: Text(
                        mealName??"",
                        textAlign: TextAlign.center,
                        style: AppTextStyle.smallBold.copyWith(
                          color: AppColors.gray1,
                        ),
                      ),
                    ),
                  ),
                  Text(
                    "Time",
                    style: AppTextStyle.smallerRegular.copyWith(
                      color: AppColors.gray4,
                    ),
                  ),
                  Row(
                    children: [
                      Text(
                        "15 Mins",
                        style: AppTextStyle.smallBold.copyWith(
                          color: AppColors.gray1,
                        ),
                      ),
                      const Spacer(),
                      Container(
                        padding: EdgeInsets.all(6.r),
                        decoration: BoxDecoration(
                          color: AppColors.white,
                          borderRadius: BorderRadius.circular(12.r),
                        ),
                        child: SvgPicture.asset(AppImages.inactive),
                      ),
                    ],
                  )
                ],
              ),
            ),
            Positioned(
              top: -50.h,
              left: 0,
              right: 0,
              child: Container(
                width: 120.w,
                height: 120.h,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(
                    image: NetworkImage(mealImage ?? AppImages.image),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
  Widget newRecipesWidget(){
    return Container(
      padding: EdgeInsets.all(16.r),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16.r),
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 6,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: 200.w,
                      child: Text(
                        "Steak with tomato sauce and bulgur rice.",
                        style: AppTextStyle.smallBold,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    SizedBox(height: 6.h),
                    Row(
                      children: List.generate(
                        5,
                            (index) => const Icon(
                          Icons.star,
                          color: Colors.orange,
                          size: 18,
                        ),
                      ),
                    ),
                    SizedBox(height: 6.h),
                    Row(
                      children: [
                        CircleAvatar(
                          radius: 12,
                          backgroundImage: NetworkImage(
                            "https://i.pravatar.cc/150?img=3",
                          ),
                        ),
                        SizedBox(width: 6.w),
                        Text(
                          "By James Milner",
                          style: AppTextStyle.smallerRegular.copyWith(
                            color: AppColors.gray3,
                          ),
                        ),
                        const Spacer(),
                        const Icon(Icons.access_time,
                            size: 16, color: Colors.grey),
                        SizedBox(width: 4.w),
                        Text(
                          "20 mins",
                          style: AppTextStyle.smallerRegular.copyWith(
                            color: AppColors.gray3,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
          Positioned(
            top: -50.h,
            right: -10.w,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(50.r),
              child: Image.asset(
                AppImages.image,
                width: 100.w,
                height: 100.w,
                fit: BoxFit.cover,
              ),
            ),
          ),
        ],
      ),
    );

  }
}
