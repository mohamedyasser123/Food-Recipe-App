import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:rec_app/core/constants/app_colors.dart';
import 'package:rec_app/core/constants/app_text_style.dart';
import 'package:rec_app/core/extensions/size_extensions.dart';
import '../../providers/meal_provider.dart';
import '../../widgets/search_widget.dart';

class SearchRecipesScreen extends StatefulWidget {
  const SearchRecipesScreen({super.key});

  @override
  State<SearchRecipesScreen> createState() => _SearchRecipesScreenState();
}
class _SearchRecipesScreenState extends State<SearchRecipesScreen> {
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
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.white,
        centerTitle: true,
        leading: Icon(Icons.arrow_back,color: AppColors.black,),
        title: Text("Search recipes",style: AppTextStyle.mediumBold.copyWith(color: AppColors.black),),
      ),
      body: Padding(
        padding:  EdgeInsets.symmetric(horizontal: 24.w),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SearchWidget(),
              16.h.heightSizedBox,
              Text("Recent Search",style: AppTextStyle.normalBold,),
              16.h.heightSizedBox,
              GridView.count(
                crossAxisCount: 2,
                crossAxisSpacing: 8,
                mainAxisSpacing: 8,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                children: List.generate(
                  provider.mealsResponse!.meals.length, (index) => searchResultWidget(
                    provider.mealsResponse?.meals[index].strImageSource,
                  ),
                ),
              )
          
          
          
            ],
          ),
        ),
      ),
    );
  }

  Widget searchResultWidget(String?imageUrl){
    return Container(
      height: 180,
      width: 180,
      padding: EdgeInsets.all(8.r),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.r),
        image: DecorationImage(image: NetworkImage(imageUrl??"https://www.themealdb.com/images/media/meals/vxuyrx1511302687.jpg"))
      ),
      child: Stack(
        alignment: AlignmentGeometry.bottomCenter,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text("Traditional spare ribs baked",style: AppTextStyle.smallerBold.copyWith(color: AppColors.white),),
              Text("By Chef John",style: AppTextStyle.smallerRegular.copyWith(color: AppColors.gray4),)
            ],
          ),


        ],
      ),
    );
  }
}
