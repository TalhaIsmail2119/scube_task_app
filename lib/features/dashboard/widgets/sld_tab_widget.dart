import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SldTab extends StatelessWidget {
  const SldTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        'SLD View',
        style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w600),
      ),
    );
  }
}
