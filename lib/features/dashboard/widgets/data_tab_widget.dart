import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DataTab extends StatelessWidget {
  const DataTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        'Data View',
        style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w600),
      ),
    );
  }
}
