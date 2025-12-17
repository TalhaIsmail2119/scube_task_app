import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

import '../../../config/theme/app_theme.dart';
import '../data/enerfy_data_items.dart';

class EnergyChartCard extends StatelessWidget {
  final String chartTitle;
  final String powerValue;
  final List<EnergyDataItem> items;

  const EnergyChartCard({
    super.key,
    required this.chartTitle,
    required this.powerValue,
    required this.items,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(8.w, 20.h, 8.w, 0.h),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10.r),
        border: Border.all(color: Color(0xFFA5A7B9)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text(
                chartTitle,
                style: TextStyle(
                  fontSize: 14.r,
                  fontWeight: FontWeight.w600,
                  color: AppTheme.dataTitle,
                ),
              ),
              Text(
                '$powerValue kw',
                style: TextStyle(
                  fontSize: 32.r,
                  fontWeight: FontWeight.w600,
                  color: AppTheme.dataTitle,
                ),
              ),
            ],
          ),
          Gap(20.h),
          ...items.map((item) => EnergyDataRow(item: item)),
        ],
      ),
    );
  }
}

class EnergyDataRow extends StatelessWidget {
  final EnergyDataItem item;

  const EnergyDataRow({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 296.w,
      height: 42.h,
      margin: EdgeInsets.only(bottom: 8.h),
      padding:  EdgeInsets.fromLTRB(4.w, 4.h, 12.w, 0.h),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(6.r),
        border: Border.all(color: Color(0xFFB6B8D0)), // testing purpose
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(
            children: [
              Container(
                width: 8.w,
                height: 8.h,
                margin:  EdgeInsets.only(top: 4.h),
                decoration: BoxDecoration(
                  color: item.color,
                  shape: BoxShape.circle,
                ),
              ),
              Gap(2.h),
              Text(
                item.title,
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 12.r,
                  color: Color(0xFF04063E),
                ),
              ),
              Gap(6.h),
            ],
          ),
          Gap(8.w),
          Container(width: 1, height: 40, color: Colors.grey.shade300),
          Gap(10.w),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text.rich(
                TextSpan(
                  children: [
                    TextSpan(
                      text: 'Data    : ',
                      style: TextStyle(
                        fontSize: 12.r,
                        color: Color(0xFF646984),
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    TextSpan(
                      text: '${item.dataValue} (${item.percentage})',
                      style: TextStyle(
                        fontSize: 12.r,
                        color: Color(0xFF04063E),
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 4),
              Text.rich(
                TextSpan(
                  children: [
                    TextSpan(
                      text: 'Cost    : ',
                      style: TextStyle(
                        fontSize: 12.r,
                        color: Color(0xFF646984),
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    TextSpan(
                      text: '${item.cost}',
                      style: TextStyle(
                        fontSize: 12.r,
                        color: Color(0xFF04063E),
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              ),

            ],
          ),
        ],
      ),
    );
  }
}
