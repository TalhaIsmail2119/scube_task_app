import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

class BottomGridWidget extends StatelessWidget {
  final List<Map<String, dynamic>> items;
  const BottomGridWidget({super.key, required this.items});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: items.length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 3.2,
        mainAxisSpacing: 12.h,
        crossAxisSpacing: 12.w,
      ),
      itemBuilder: (_, i) {
        return Container(
          padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 12.h),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12.r),
            border: Border.all(color: Color(0xFFB6B8D0)),
          ),
          child: Row(
            children: [
              Image.asset(items[i]['image'] as String, width: 24.w, height: 24.h, fit: BoxFit.contain),
              Gap(8.w),
              Expanded(
                child: Text(
                  items[i]['name'] as String,
                  style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 14.r,
                      color: Color(0xFF646984)),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
