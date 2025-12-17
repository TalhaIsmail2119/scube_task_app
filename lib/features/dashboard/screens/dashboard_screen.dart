import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:scube_task_app/config/app_route/app_routes.dart';
import 'package:scube_task_app/features/dashboard/widgets/bottom_grid_widget.dart';
import 'package:scube_task_app/features/dashboard/widgets/summary-container.dart';
import 'package:scube_task_app/shared/custom_app_bar.dart';
import '../data/bottom_items.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  bool isSource = true;
  double powerPercent = 5.53;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        onBackPressed: () {
          context.goNamed(AppRoutes.login);
        },
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.fromLTRB(24.w, 12.h, 24.w, 24.h),
        child: Column(
          children: [
            SummaryContainer(
              tabController: _tabController,
              isSource: isSource,
              powerPercent: powerPercent,
              onSourceLoadChange: (value) => setState(() => isSource = value),
              onPowerPercentChange: (value) =>
                  setState(() => powerPercent = value),
            ),
            Gap(20.h),
            GestureDetector(
              onTap: () {
                context.goNamed(AppRoutes.data_loaading);
              },
              child: BottomGridWidget(items: items),
            ),
          ],
        ),
      ),
    );
  }
}
