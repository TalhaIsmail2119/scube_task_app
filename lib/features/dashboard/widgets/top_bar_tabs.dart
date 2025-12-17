import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../config/theme/app_theme.dart';

class TopTabs extends StatelessWidget {
  final TabController tabController;

  const TopTabs({super.key, required this.tabController});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 38.h,
      color: AppTheme.surfaceBackground,
      child: Column(
        children: [
          Expanded(
            child: TabBar(
              controller: tabController,
              indicator: BoxDecoration(
                color: const Color(0xFF42A5F5),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(11.r),
                  topRight: Radius.circular(11.r),
                ),
              ),
              indicatorSize: TabBarIndicatorSize.tab,
              dividerColor: Colors.transparent,
              labelColor: Colors.white,
              unselectedLabelColor: const Color(0xFF9E9E9E),
              labelStyle: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w600),
              unselectedLabelStyle: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w500),
              tabs: const [
                Tab(text: 'Summery'),
                Tab(text: 'SLD'),
                Tab(text: 'Data'),
              ],
            ),
          ),
          Container(height: 1, color: Colors.grey),
        ],
      ),
    );
  }
}
