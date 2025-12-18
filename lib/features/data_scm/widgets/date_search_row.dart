import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

class DateSearchRow extends StatelessWidget {
  const DateSearchRow({super.key});

  Widget _dateField({
    required String hint,
  }) {
    return Expanded(
      child: Container(
        height: 36.h,
        width: 127.w,
        padding: EdgeInsets.symmetric(horizontal: 12.w),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(6.r),
          border: Border.all(
            color: const Color(0xFFA5A7B9),
            width: 1,
          ),
        ),
        child: Row(
          children: [
            Expanded(
              child: Text(
                hint,
                style: TextStyle(
                  fontSize: 12.r,
                  fontWeight: FontWeight.w400,
                  color: const Color(0xFF646984),
                ),
              ),
            ),
            Icon(
              Icons.calendar_today_outlined,
              size: 18.r,
              color: const Color(0xFF646984),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(6.w),
      child: Row(
        children: [
          _dateField(hint: 'From Date'),
          Gap(4.w),
          _dateField(hint: 'To Date'),
          Gap(4.w),
          Container(
            height: 36.h,
            width: 34.w,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8.r),
              border: Border.all(
                color: const Color(0xFF0096FC),
                width: 1.5,
              ),
            ),
            alignment: Alignment.center,
            child: Icon(
              Icons.search,
              size: 22.sp,
              color: const Color(0xFF0096FC),
            ),
          ),
        ],
      ),
    );
  }
}
