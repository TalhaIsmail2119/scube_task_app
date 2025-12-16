
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

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

  static const _borderColor = Color(0xFF9AA5C4);

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
      margin: EdgeInsets.all(16.w),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12.r),
        border: Border.all(color: _borderColor),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          /// HEADER (no side/top borders)
          Container(
            padding: EdgeInsets.all(16.w),
            decoration: BoxDecoration(
              border: Border(
                bottom: _isExpanded
                    ? const BorderSide(color: _borderColor)
                    : BorderSide.none,
              ),
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
                    fontSize: 14.sp,
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
                          ? Icons.keyboard_arrow_up
                          : Icons.keyboard_arrow_down,
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
              padding: EdgeInsets.all(16.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: widget.items
                    .map(
                      (item) => Padding(
                    padding: EdgeInsets.only(bottom: 14.h),
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
                        SizedBox(height: 4.h),
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
