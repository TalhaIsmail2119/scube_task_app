import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'power_indicator_widget.dart';
import 'source_load_toggle_widget.dart';
import 'data_section_widget.dart';

class SummaryTab extends StatelessWidget {
  final bool isSource;
  final double powerPercent;
  final ValueChanged<bool> onSourceLoadChange;
  final ValueChanged<double> onPowerPercentChange;

  const SummaryTab({
    super.key,
    required this.isSource,
    required this.powerPercent,
    required this.onSourceLoadChange,
    required this.onPowerPercentChange,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text('Electricity', style: TextStyle(fontSize: 16.r, fontWeight: FontWeight.w600)),
        Gap(8.h),
        Divider(height: 1.r, thickness: 1.r, color: Colors.grey.shade300),
        Gap(14.h),
        PowerIndicatorWidget(
          powerPercent: powerPercent,
          onChange: onPowerPercentChange,
        ),
        Gap(14.h),
        SourceLoadToggleWidget(isSource: isSource, onChange: onSourceLoadChange),
        Gap(4.h),
        Divider(thickness: 2.r, height: 2.r, color: Colors.grey.shade300),
        Gap(8.h),
        DataSectionWidget(),
      ],
    );
  }
}
