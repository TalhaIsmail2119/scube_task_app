import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import '../screens/scm_data_screen.dart';
class DataRevenueToggle extends StatelessWidget {
  final ScmViewType value;
  final ValueChanged<ScmViewType> onChanged;

  const DataRevenueToggle({
    required this.value,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 48.h,
      width: 312.w,
      padding:  EdgeInsets.fromLTRB( 4.w, 12.h, 16.w, 14.h),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12.r),
        border: Border.all(
          color: Color(0xFFA5A7B9),
        )
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _item('Data View', ScmViewType.data),
          _item('Revenue View', ScmViewType.revenue),
        ],
      ),
    );
  }

  Widget _item(String text, ScmViewType type) {
    final selected = value == type;

    return Expanded(
      child: GestureDetector(
        onTap: () => onChanged(type),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.circle,
              size: 12.r,
              color: selected ? Color(0xFF0096FC) : Colors.grey,
            ),
            Gap(6.w),
            Text(
              text,
              style: TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 16.r,
                color: selected ? Colors.blue : Colors.grey,
              ),
            ),
          ],
        ),
      ),
    );
  }

}