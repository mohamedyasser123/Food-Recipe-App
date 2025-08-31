import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:rec_app/core/constants/app_colors.dart';
import 'package:rec_app/core/constants/app_images.dart';
import 'package:rec_app/core/constants/app_text_style.dart';

class SearchWidget extends StatelessWidget {
  final Function()? onTab;
   const SearchWidget({super.key, this.onTab});
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          flex: 6,
          child: TextFormField(
            onTap: onTab,
            decoration: InputDecoration(
              hint: Text("Search recipe",
              style: AppTextStyle.smallerRegular.copyWith(color: AppColors.gray4),
              ),
              prefixIcon: Icon(
                Icons.search_sharp,
                size: 24,
                color: AppColors.gray4.withValues(alpha: .5),
              ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16.r),
                  borderSide: BorderSide(
                    color: AppColors.gray4.withValues(alpha: 0.5),
                    width: 1,
                  ),
                ),
                disabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16.r),
                  borderSide: BorderSide(
                    color: AppColors.gray4,
                    width: 1,
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16.r),
                  borderSide: BorderSide(
                    color: AppColors.primary100,
                    width: 1.5,
                  ),
                ),

              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(16.r),
               borderSide: BorderSide(
                 color: AppColors.white,
                 width: 1
               ),
              )
            ),

          ),
        ),
        Spacer(),
        Expanded(
          flex: 1,
            child: Container(
              padding: EdgeInsets.all(10.r),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.r),
                color: AppColors.primary100,
              ),
              child:Icon(Icons.filter_alt,color: AppColors.white,),
            ))
      ],
    );
  }
}
