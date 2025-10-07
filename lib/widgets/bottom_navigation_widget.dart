import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rec_app/core/constants/app_colors.dart';

class CustomBottomAppBar extends StatelessWidget {
  final int selectedIndex;
  final ValueChanged<int> onTap;

  const CustomBottomAppBar({
    super.key,
    required this.selectedIndex,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      color: AppColors.white,
      shape: const CircularNotchedRectangle(),
      notchMargin: 8,
      height: 100.h,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          IconButton(
            icon: Icon(Icons.home_filled,
                color: selectedIndex == 0 ? AppColors.primary100 : AppColors.gray4),
            onPressed: () => onTap(0),
          ),
          IconButton(
            icon: Icon(Icons.bookmark,
                color: selectedIndex == 1 ? AppColors.primary100 : AppColors.gray4),
            onPressed: () => onTap(1),
          ),
          const SizedBox(width: 48),
          IconButton(
            icon: Icon(Icons.notifications,
                color: selectedIndex == 2 ? AppColors.primary100 : AppColors.gray4),
            onPressed: () => onTap(2),
          ),
          IconButton(
            icon: Icon(Icons.person,
                color: selectedIndex == 3 ? AppColors.primary100 : AppColors.gray4),
            onPressed: () => onTap(3),
          ),
        ],
      ),
    );
  }
}

