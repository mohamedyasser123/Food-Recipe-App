import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rec_app/core/constants/app_colors.dart';
import '../presention/screens/home_screen.dart';
import 'bottom_navigation_widget.dart';

class MainLayout extends StatefulWidget {
  const MainLayout({super.key});

  @override
  State<MainLayout> createState() => _MainLayoutState();
}

class _MainLayoutState extends State<MainLayout> {
  int appBarIndex = 0;
  final List<Widget> pages = const [
    HomeScreen(),
    // BookmarkScreen(),
    // NotificationScreen(),
    // ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[appBarIndex],
      floatingActionButton: FloatingActionButton(
        shape: OutlineInputBorder(
          borderRadius: BorderRadius.circular(50.r),
          borderSide: BorderSide(color: AppColors.primary100)
        ),
        backgroundColor: AppColors.primary100,
        onPressed: () {
          showModalBottomSheet(
            context: context,
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
            ),
            builder: (context) => const SizedBox(
              height: 250,
              child: Center(
                child: Text("Bottom Sheet Opened!"),
              ),
            ),
          );
        },
        child: const Icon(Icons.add, size: 32,color: AppColors.white,),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.miniCenterDocked,
      bottomNavigationBar: CustomBottomAppBar(
        selectedIndex: appBarIndex,
        onTap: (i) => setState(() => appBarIndex = i),
      ),
    );
  }
}