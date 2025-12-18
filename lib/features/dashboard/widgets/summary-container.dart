import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:scube_task_app/features/dashboard/widgets/top_bar_tabs.dart';
import 'summary_tab_widget.dart';
import 'sld_tab_widget.dart';
import 'data_tab_widget.dart';

class SummaryContainer extends StatelessWidget {
  final TabController tabController;
  final bool isSource;
  final double powerPercent;
  final ValueChanged<bool> onSourceLoadChange;
  final ValueChanged<double> onPowerPercentChange;

  const SummaryContainer({
    super.key,
    required this.tabController,
    required this.isSource,
    required this.powerPercent,
    required this.onSourceLoadChange,
    required this.onPowerPercentChange,
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(11.r),
      clipBehavior: Clip.hardEdge,
      child: Container(
        width: double.infinity,
        decoration: const BoxDecoration(color: Colors.white),
        foregroundDecoration: BoxDecoration(
          borderRadius: BorderRadius.circular(11.r),
          border: Border.all(color: Colors.grey),
        ),
        child: Column(
          children: [
            TopTabs(tabController: tabController),
            Padding(
              padding: EdgeInsets.all(12.w),
              child: SizedBox(
                height: 498.h,
                child: TabBarView(
                  controller: tabController,
                  physics: const NeverScrollableScrollPhysics(),
                  children: [
                    SummaryTab(
                      isSource: isSource,
                      powerPercent: powerPercent,
                      onSourceLoadChange: onSourceLoadChange,
                      onPowerPercentChange: onPowerPercentChange,
                    ),
                    SldTab(),
                    DataTab(),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
