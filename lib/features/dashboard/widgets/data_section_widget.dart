import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../config/app_route/app_routes.dart';
import 'package:go_router/go_router.dart';
import '../data/data_card_data.dart';
import 'data_card_widget.dart';


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

