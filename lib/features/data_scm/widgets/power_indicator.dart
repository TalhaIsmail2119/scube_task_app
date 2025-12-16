import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:sleek_circular_slider/sleek_circular_slider.dart';

class PowerIndicator extends StatelessWidget {
  const PowerIndicator({
    super.key,
    required this.powerValue,
    this.min = 0,
    this.max = 100,
    this.onChanged,
  });

  final double powerValue;
  final double min;
  final double max;
  final ValueChanged<double>? onChanged;

  @override
  Widget build(BuildContext context) {
    return SleekCircularSlider(
      appearance: CircularSliderAppearance(
        size: 150.w,
        startAngle: 150,
        angleRange: 360,
        customWidths: CustomSliderWidths(
          trackWidth: 20.w,
          progressBarWidth: 20.w,
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
      innerWidget: (value) => _CenterContent(value: value),
    );
  }
}

class _CenterContent extends StatelessWidget {
  const _CenterContent({required this.value});

  final double value;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          'Total Power',
          style: TextStyle(
            fontSize: 12.r,
            color: Colors.grey,
            fontWeight: FontWeight.w500,
          ),
        ),
        Gap(6.h),
        Text(
          '${value.toStringAsFixed(2)} kw',
          style: TextStyle(
            fontSize: 22.r,
            fontWeight: FontWeight.w700,
          ),
        ),
      ],
    );
  }
}
