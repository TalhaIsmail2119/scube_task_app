import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:sleek_circular_slider/sleek_circular_slider.dart';

class PowerIndicatorWidget extends StatelessWidget {
  final double powerPercent;
  final ValueChanged<double> onChange;

  const PowerIndicatorWidget({super.key, required this.powerPercent, required this.onChange});

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
      min: 0,
      max: 5.53,
      initialValue: powerPercent,
      onChange: onChange,
      innerWidget: (value) {
        return Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Total Power',
                style: TextStyle(
                    fontSize: 12.r, color: Colors.grey, fontWeight: FontWeight.w500)),
            Gap(6.h),
            Text('${value.toStringAsFixed(2)} kw',
                style: TextStyle(fontSize: 22.r, fontWeight: FontWeight.w700)),
          ],
        );
      },
    );
  }
}
