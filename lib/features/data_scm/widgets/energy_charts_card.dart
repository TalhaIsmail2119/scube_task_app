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
      padding: EdgeInsets.fromLTRB(8.w, 20.h, 8.w, 8.h),
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

          /// Data Items
          ...items.map((item) => EnergyDataRow(item: item),),
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
      margin:  EdgeInsets.only(bottom: 10.h),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: Color(0xFFB6B8D0)), // testing purpose
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(
            children: [
              Container(
                width: 10.w,
                height: 10.h,
                margin: const EdgeInsets.only(top: 4),
                decoration: BoxDecoration(
                  color: item.color,
                  shape: BoxShape.circle,
                ),
              ),

              const SizedBox(width: 8),

              Text(
                item.title,
                style: const TextStyle(fontWeight: FontWeight.w600),
              ),

              const SizedBox(width: 8),
            ],
          ),

          const SizedBox(width: 8),

          /// VERTICAL DIVIDER
          Container(width: 1, height: 40, color: Colors.grey.shade300),

          const SizedBox(width: 10),

          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Data : ${item.dataValue} (${item.percentage})',
                style: const TextStyle(fontSize: 12),
              ),
              const SizedBox(height: 4),
              Text('Cost : ${item.cost}', style: const TextStyle(fontSize: 12)),
            ],
          ),
        ],
      ),
    );
  }
}
