import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../config/app_route/app_routes.dart';
import 'package:go_router/go_router.dart';

import '../data/data_card_data.dart';
import '../data/data_card_model.dart';
import 'data_card_widget.dart';

// class DataSectionWidget extends StatelessWidget {
//   const DataSectionWidget({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     final controller = ScrollController();
//     return SizedBox(
//       height: 229.h,
//       child: Scrollbar(
//         controller: controller,
//         thumbVisibility: true,
//         thickness: 4.w,
//         radius: Radius.circular(8.r),
//         child: ListView(
//           controller: controller,
//           padding: EdgeInsets.only(right: 8.w),
//           children: [
//             GestureDetector(
//               onTap: () => context.goNamed(AppRoutes.data_scm),
//               child: DataCardWidget(
//                 title: 'Data View',
//                 imagePath: 'assets/images/solar_cell.png',
//                 active: true,
//                // icon: Icons.solar_power,
//                 iconColor: Color(0xFF78C6FF),
//                 cardColor: Color(0xFFE5F4FE),
//                 data1value: '55505.63',
//                 data2value: '58805.63',
//               ),
//             ),
//             DataCardWidget(
//               title: 'Data Type 2',
//               imagePath: 'assets/images/data_2.png',
//               active: true,
//               //icon: Icons.factory,
//               iconColor: Color(0xFFFB902E),
//               cardColor: Color(0xFFE5F4FE),
//               data1value: '55505.63',
//               data2value: '58805.63',
//             ),
//             DataCardWidget(
//               title: 'Data Type 3',
//               imagePath: 'assets/images/power.png',
//               active: false,
//               //icon: Icons.settings_input_component,
//               iconColor: Color(0xFF78C6FF),
//               cardColor: Color(0xFFE5F4FE),
//               data1value: '55505.63',
//               data2value: '58805.63',
//             ),
//             DataCardWidget(
//               title: 'Total Solar',
//               imagePath: 'assets/images/solar_cell.png',
//               active: true,
//               //icon: Icons.factory,
//               iconColor: Colors.orange,
//               cardColor: Color(0xFFF0F1FF),
//               data1value:'55505.63 kW',
//               data2value:'58805.63 kWh',
//               data1Title: 'Live Power :',
//               data2Title: 'Today Energy :',
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

class DataSectionWidget extends StatelessWidget {
  const DataSectionWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = ScrollController();
    return SizedBox(
      //height: 229.h,
      child: ScrollbarTheme(
        data: ScrollbarThemeData(
          thumbColor: MaterialStateProperty.all(Colors.blue),
          trackColor: MaterialStateProperty.all(Colors.grey.shade300),
          radius: Radius.circular(8.r),
          minThumbLength: 20.0.h,
        ),
        child: Scrollbar(
          controller: controller,
          thumbVisibility: true,
          thickness: 4.w,
          radius: Radius.circular(8.r),
          trackVisibility: true,
          child: ListView.builder(
            controller: controller,
            padding: EdgeInsets.only(right: 8.w),
            itemCount: cards.length,
            itemBuilder: (context, index) {
              final card = cards[index];
              if (index == 0) {
                return GestureDetector(
                  onTap: () => context.goNamed(AppRoutes.data_scm),
                  child: DataCardWidget(card: card),
                );
              } else {
                return DataCardWidget(card: card);
              }
            },
          ),
        ),
      ),
    );
  }
}

