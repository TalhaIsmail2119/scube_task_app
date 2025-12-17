import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../config/app_route/app_routes.dart';
import 'package:go_router/go_router.dart';

import 'data_card_widget.dart';

class DataSectionWidget extends StatelessWidget {
  const DataSectionWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = ScrollController();
    return SizedBox(
      height: 229.h,
      child: Scrollbar(
        controller: controller,
        thumbVisibility: true,
        thickness: 4.w,
        radius: Radius.circular(8.r),
        child: ListView(
          controller: controller,
          padding: EdgeInsets.only(right: 8.w),
          children: [
            GestureDetector(
              onTap: () => context.goNamed(AppRoutes.data_scm),
              child: DataCardWidget(
                title: 'Data View',
                imagePath: 'assets/images/solar_cell.png',
                active: true,
                icon: Icons.solar_power,
                iconColor: Colors.blue,
                cardColor: Color(0xFFE5F4FE),
              ),
            ),
            DataCardWidget(
              title: 'Data Type 2',
              imagePath: 'assets/images/data_2.png',
              active: true,
              icon: Icons.factory,
              iconColor: Colors.orange,
              cardColor: Color(0xFFE5F4FE),
            ),
            DataCardWidget(
              title: 'Data Type 3',
              imagePath: 'assets/images/power.png',
              active: false,
              icon: Icons.settings_input_component,
              iconColor: Colors.blue,
              cardColor: Color(0xFFE5F4FE),
            ),
            DataCardWidget(
              title: 'Total Solar',
              imagePath: 'assets/images/solar_cell.png',
              active: true,
              icon: Icons.factory,
              iconColor: Colors.orange,
              cardColor: Color(0xFFA5A7B9),
            ),
          ],
        ),
      ),
    );
  }
}
