
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:sleek_circular_slider/sleek_circular_slider.dart';

class PowerIndicator extends StatelessWidget {
  const PowerIndicator({
    super.key,
    required this.powerValue,
    required this.centerValue,
    required this.unitText,
    required this.startAngle,
    this.min = 0,
    this.max = 100,
    this.angleRange = 240,
    this.onChanged,
  });

  final double powerValue;
  final double min;
  final double max;
  final double angleRange;
  final double startAngle;
  final String centerValue;
  final String unitText;

  final ValueChanged<double>? onChanged;

  @override
  Widget build(BuildContext context) {
    return SleekCircularSlider(
      appearance: CircularSliderAppearance(
        size: 160.w,
        startAngle: startAngle,
        angleRange: angleRange,
        customWidths: CustomSliderWidths(
          trackWidth: 15.r,
          progressBarWidth: 15.r,
          handlerSize: 0,
        ),
        customColors: CustomSliderColors(
          trackColor: const Color(0xFFE0E0E0),
          progressBarColor: const Color(0xFF42A5F5),
          dotColor: Colors.transparent,
          hideShadow: true,
        ),
        infoProperties: InfoProperties(modifier: (_) => ''),
      ),
      min: min,
      max: max,
      initialValue: powerValue,
      onChange: onChanged,
      innerWidget: (_) => _CenterContent(
        value: centerValue,
        unit: unitText,
      ),
    );
  }
}

class _CenterContent extends StatelessWidget {
  const _CenterContent({
    required this.value,
    required this.unit,
  });

  final String value;
  final String unit;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          value,
          style: TextStyle(
            fontSize: 22.r,
            fontWeight: FontWeight.w700,
          ),
        ),
        Gap(4.h),
        Text(
          unit,
          style: TextStyle(
            fontSize: 12.r,
            color: Colors.grey,
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }
}

