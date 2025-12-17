
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

import '../../../config/theme/app_theme.dart';
import '../data/data_cost_item.dart';

class DataCostInfoCard extends StatefulWidget {
  final List<DataCostItem> items;
  final bool initiallyExpanded;

  const DataCostInfoCard({
    super.key,
    required this.items,
    this.initiallyExpanded = true,
  });

  @override
  State<DataCostInfoCard> createState() => _DataCostInfoCardState();
}

class _DataCostInfoCardState extends State<DataCostInfoCard> {
  late bool _isExpanded;

  static const _borderColor = Color(0xFFA5A7B9);

  @override
  void initState() {
    super.initState();
    _isExpanded = widget.initiallyExpanded;
  }

  void _toggle() {
    setState(() {
      _isExpanded = !_isExpanded;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12.r),
        border: Border.all(color: AppTheme.borderColor),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: EdgeInsets.fromLTRB(12.w, 9.h, 12.w, 9.h),
            decoration: BoxDecoration(
              border: Border(
                bottom: _isExpanded
                    ? const BorderSide(color: AppTheme.borderColor)
                    : BorderSide.none,
              ),
              borderRadius: BorderRadius.circular(12.r),
            ),
            child: Row(
              children: [
                Icon(
                  Icons.bar_chart,
                  size: 20.sp,
                  color: const Color(0xFF3F4F9F),
                ),
                SizedBox(width: 8.w),
                Text(
                  'Data & Cost Info',
                  style: TextStyle(
                    fontSize: 14.r,
                    fontWeight: FontWeight.w600,
                    color: const Color(0xFF1F2A5A),
                  ),
                ),
                const Spacer(),
                GestureDetector(
                  onTap: _toggle,
                  child: Container(
                    width: 28.w,
                    height: 28.w,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: Color(0xFF1E88E5),
                    ),
                    child: Icon(
                      _isExpanded
                          ? Icons.keyboard_double_arrow_up
                          : Icons.keyboard_double_arrow_down,
                      color: Colors.white,
                      size: 20,
                    ),
                  ),
                ),
              ],
            ),
          ),

          /// CONTENT
          if (_isExpanded)
            Padding(
              padding: EdgeInsets.fromLTRB(12.w, 14.h, 12.w, 1.h),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: widget.items
                    .map(
                      (item) => Padding(
                    padding: EdgeInsets.only(bottom: 12.h),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        RichText(
                          text: TextSpan(
                            style: TextStyle(
                              fontSize: 13.sp,
                              color: const Color(0xFF5A6282),
                            ),
                            children: [
                              TextSpan(text: '${item.dataLabel} : '),
                              TextSpan(
                                text:
                                '${item.dataValue} (${item.percentage}%)',
                                style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  color: const Color(0xFF1F2A5A),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Gap(4.h),
                        RichText(
                          text: TextSpan(
                            style: TextStyle(
                              fontSize: 13.sp,
                              color: const Color(0xFF5A6282),
                            ),
                            children: [
                              TextSpan(text: '${item.costLabel} : '),
                              TextSpan(
                                text: '${item.costValue} ৳',
                                style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  color: const Color(0xFF1F2A5A),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                )
                    .toList(),
              ),
            ),
        ],
      ),
    );
  }
}
