import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../config/theme/app_theme.dart';
import 'package:gap/gap.dart';

import '../data/data_card_model.dart';

// class DataCardWidget extends StatelessWidget {
//   final String title;
//   final String imagePath;
//   final bool active;
//   //final IconData icon;
//   final Color iconColor;
//   final Color cardColor;
//   final String data1value;
//   final String data2value;
//   final String? data1Title;
//   final String? data2Title;
//
//   const DataCardWidget({
//     super.key,
//     required this.title,
//     required this.imagePath,
//     required this.active,
//     //required this.icon,
//     required this.iconColor,
//     required this.cardColor,
//     required this.data1value,
//     required this.data2value,
//     this.data1Title,
//     this.data2Title,
//   });
//
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       height: 71.h,
//       margin: EdgeInsets.only(bottom: 8.h),
//       padding: EdgeInsets.fromLTRB(8.w, 8.h, 8.w, 7.h),
//       decoration: BoxDecoration(
//         color: cardColor,
//         borderRadius: BorderRadius.circular(12.r),
//         border: Border.all(color: Color(0xFFA5A7B9)),
//       ),
//       child: Row(
//         children: [
//           Image.asset(imagePath, width: 24.r, height: 24.r, fit: BoxFit.contain),
//           Gap(12.w),
//           Expanded(
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 Row(
//                   children: [
//                     Container(
//                       width: 12,
//                       height: 12,
//                       decoration: BoxDecoration(
//                         color: iconColor,
//                         borderRadius: BorderRadius.circular(2.r),
//                       ),
//                     ),
//                     Gap(8.w),
//                     Text(
//                       title,
//                       style: TextStyle(
//                           fontWeight: FontWeight.w500,
//                           fontSize: 14.r,
//                           color: AppTheme.dataTitle),
//                     ),
//                     Gap(14.w),
//                     Text(
//                       active ? '(Active)' : '(Inactive)',
//                       style: TextStyle(
//                         fontSize: 10.r,
//                         color: active ? Colors.blue : Colors.red,
//                         fontWeight: FontWeight.w500,
//                       ),
//                     ),
//                   ],
//                 ),
//                 Gap(3.h),
//                 Text.rich(
//                   TextSpan(
//                     children: [
//                       TextSpan(
//                           text: '${data1Title ?? 'Data 1  : '}',
//                           style: TextStyle(
//                               fontWeight: FontWeight.w500,
//                               color: Colors.grey.shade400,
//                               fontSize: 12.r)),
//                       TextSpan(
//                           text: data1value,
//                           style: TextStyle(
//                               fontWeight: FontWeight.w500,
//                               color: AppTheme.dataTitle,
//                               fontSize: 12.r)),
//                     ],
//                   ),
//                 ),
//                 Text.rich(
//                   TextSpan(
//                     children: [
//                       TextSpan(
//                           text: '${data2Title ?? 'Data 1  : '}',
//                           style: TextStyle(
//                               fontWeight: FontWeight.w400,
//                               color: Colors.grey.shade400,
//                               fontSize: 12.r)),
//                       TextSpan(
//                           text: data2value,
//                           style: TextStyle(
//                               fontWeight: FontWeight.w400,
//                               color: AppTheme.dataTitle,
//                               fontSize: 12.r)),
//                     ],
//                   ),
//                 ),
//               ],
//             ),
//           ),
//           Icon(Icons.keyboard_arrow_right, color: Color(0xFF646984), size: 34.r),
//         ],
//       ),
//     );
//   }
// }

class DataCardWidget extends StatelessWidget {
  final DataCardModel card;

  const DataCardWidget({super.key, required this.card});

  @override
  Widget build(BuildContext context) {
    return Container(
      //height: 71.h,
      margin: EdgeInsets.only(bottom: 8.h),
      padding: EdgeInsets.fromLTRB(8.w, 8.h, 8.w, 7.h),
      decoration: BoxDecoration(
        color: card.cardColor,
        borderRadius: BorderRadius.circular(12.r),
        border: Border.all(color: Color(0xFFA5A7B9)),
      ),
      child: Row(
        children: [
          Image.asset(card.imagePath, width: 24.r, height: 24.r, fit: BoxFit.contain),
          Gap(12.w),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  children: [
                    Container(
                      width: 12.w,
                      height: 12.h,
                      decoration: BoxDecoration(
                        color: card.iconColor,
                        borderRadius: BorderRadius.circular(2.r),
                      ),
                    ),
                    Gap(8.w),
                    Text(
                      card.title,
                      style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 14.r,
                          color: AppTheme.dataTitle),
                    ),
                    Gap(14.w),
                    Text(
                      card.active ? '(Active)' : '(Inactive)',
                      style: TextStyle(
                        fontSize: 10.r,
                        color: card.active ? Colors.blue : Colors.red,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
                Gap(3.h),
                Text.rich(
                  TextSpan(
                    children: [
                      TextSpan(
                        text: '${card.data1Title ?? 'Data 1  : '}',
                        style: TextStyle(
                            fontWeight: FontWeight.w500,
                            color: Colors.grey.shade400,
                            fontSize: 12.r),
                      ),
                      TextSpan(
                        text: card.data1Value,
                        style: TextStyle(
                            fontWeight: FontWeight.w500,
                            color: AppTheme.dataTitle,
                            fontSize: 12.r),
                      ),
                    ],
                  ),
                ),
                Text.rich(
                  TextSpan(
                    children: [
                      TextSpan(
                        text: '${card.data2Title ?? 'Data 2  : '}',
                        style: TextStyle(
                            fontWeight: FontWeight.w400,
                            color: Colors.grey.shade400,
                            fontSize: 12.r),
                      ),
                      TextSpan(
                        text: card.data2Value,
                        style: TextStyle(
                            fontWeight: FontWeight.w500,
                            color: AppTheme.dataTitle,
                            fontSize: 12.r),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Icon(Icons.keyboard_arrow_right, color: Color(0xFF646984), size: 34.r),
        ],
      ),
    );
  }
}

