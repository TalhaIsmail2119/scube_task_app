import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SourceLoadToggleWidget extends StatelessWidget {
  final bool isSource;
  final ValueChanged<bool> onChange;

  const SourceLoadToggleWidget({super.key, required this.isSource, required this.onChange});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 254.w,
      height: 32.h,
      decoration: BoxDecoration(
        color: const Color(0xFFEEEEEE),
        borderRadius: BorderRadius.circular(16.r),
      ),
      child: Row(
        children: [
          _toggleBtn('Source', isSource, () => onChange(true)),
          _toggleBtn('Load', !isSource, () => onChange(false)),
        ],
      ),
    );
  }

  Widget _toggleBtn(String text, bool active, VoidCallback onTap) {
    return Expanded(
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          decoration: BoxDecoration(
            color: active ? const Color(0xFF42A5F5) : Colors.transparent,
            borderRadius: BorderRadius.circular(30.r),
          ),
          alignment: Alignment.center,
          child: Text(
            text,
            style: TextStyle(
              fontSize: 14.sp,
              fontWeight: FontWeight.w600,
              color: active ? Colors.white : const Color(0xFF9E9E9E),
            ),
          ),
        ),
      ),
    );
  }
}
