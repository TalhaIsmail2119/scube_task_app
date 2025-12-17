import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:scube_task_app/shared/custom_app_bar.dart';

import '../../../config/app_route/app_routes.dart';

class DataLoadignScreen extends StatelessWidget {
  const DataLoadignScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        onBackPressed: (){
          context.goNamed(AppRoutes.dashboard);
        },
      ),
      body: SafeArea(
        child: Container(
          width: double.infinity,
          margin: EdgeInsets.fromLTRB(24.w, 12.h, 24.w, 23.h),
          padding: EdgeInsets.fromLTRB(51.w, 148.h, 50.w, 312.h),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12.r),
          ),
          child: Column(
           // mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image(
                image:  AssetImage('assets/images/data_laod_image.png'),
                fit: BoxFit.cover,
              ),
              Gap(12.h),
              Text(
                'No data is here,\nplease wait.',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w400,
                  color: const Color(0xFF6B7280),
                  height: 1.4,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
