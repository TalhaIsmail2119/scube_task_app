import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:scube_task_app/config/app_route/app_routes.dart';
import 'package:sleek_circular_slider/sleek_circular_slider.dart';
import '../../../config/theme/app_theme.dart';
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
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: Icon(Icons.arrow_back, color: Colors.black, size: 20.sp),
        centerTitle: true,
        title: Text(
          'SCM',
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.w600,
            fontSize: 18.sp,
          ),
        ),
        actions: [
          Padding(
            padding: EdgeInsets.only(right: 16.w),
            child: Stack(
              children: [
                Icon(
                  Icons.notifications_none,
                  color: Colors.black,
                  size: 24.sp,
                ),
                Positioned(
                  right: 0,
                  top: 0,
                  child: Container(
                    width: 8.w,
                    height: 8.h,
                    decoration: const BoxDecoration(
                      color: Colors.red,
                      shape: BoxShape.circle,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        // padding: EdgeInsets.all(16.w),
        padding: EdgeInsets.fromLTRB(24.w, 12.h, 24.w, 24.h),
        child: Column(
          children: [_summaryContainer(), Gap(20.h), _bottomGrid()],
        ),
      ),
    );
  }

  // ------------------- SUMMARY CONTAINER -------------------
  Widget _summaryContainer() {
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
            _topTabs(),
            Padding(
              padding: EdgeInsets.fromLTRB(12.w, 12.h, 12.w, 12.h),
              child: SizedBox(
                height: 498.h,
                child: TabBarView(
                  controller: _tabController,
                  physics: const NeverScrollableScrollPhysics(),
                  children: [_summaryTab(), _sldTab(), _dataTab()],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // ------------------- TOP TABS -------------------
  Widget _topTabs() {
    return Container(
      height: 38.h,
      color: AppTheme.surfaceBackground, // Tab bar background
      child: Column(
        children: [
          Expanded(
            child: TabBar(
              controller: _tabController,
              indicator: BoxDecoration(
                color: const Color(0xFF42A5F5),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(11.r),
                  topRight: Radius.circular(11.r),
                ),
              ),
              indicatorSize: TabBarIndicatorSize.tab,
              dividerColor: Colors.transparent,
              labelColor: Colors.white,
              unselectedLabelColor: const Color(0xFF9E9E9E),
              labelStyle: TextStyle(
                fontSize: 14.sp,
                fontWeight: FontWeight.w600,
              ),
              unselectedLabelStyle: TextStyle(
                fontSize: 14.sp,
                fontWeight: FontWeight.w500,
              ),
              tabs: const [
                Tab(text: 'Summery'),
                Tab(text: 'SLD'),
                Tab(text: 'Data'),
              ],
            ),
          ),
          Container(
            height: 1,
            color: Colors.grey, // bottom divider
          ),
        ],
      ),
    );
  }

  // ------------------- SUMMARY TAB -------------------
  Widget _summaryTab() {
    return Column(
      children: [
        Text(
          'Electricity',
          style: TextStyle(fontSize: 16.r, fontWeight: FontWeight.w600),
        ),
        // SizedBox(height: 16.h),
        Gap(8.h),
        Divider(height: 1.r, thickness: 1.r, color: Colors.grey.shade300),
        Gap(14.h),
        _powerIndicator(),
        Gap(14.h),
        _sourceLoadToggle(),
        Gap(4.h),
        Divider(thickness: 2.r, height: 2.r, color: Colors.grey.shade300),
        Gap(8.h),
        _dataSection(),
      ],
    );
  }

  // ------------------- SLD TAB -------------------
  Widget _sldTab() {
    return Center(
      child: Text(
        'SLD View',
        style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w600),
      ),
    );
  }

  // ------------------- DATA TAB -------------------
  Widget _dataTab() {
    return Center(
      child: Text(
        'Data View',
        style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w600),
      ),
    );
  }

  // ------------------- POWER INDICATOR -------------------
  Widget _powerIndicator() {
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
      max: 10,
      initialValue: powerPercent,
      onChange: (value) {
        setState(() => powerPercent = value);
      },
      innerWidget: (value) {
        return Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Total Power',
              style: TextStyle(
                fontSize: 12.r,
                color: Colors.grey,
                fontWeight: FontWeight.w500,
              ),
            ),
            Gap(6.h),
            Text(
              '${value.toStringAsFixed(2)} kw',
              style: TextStyle(fontSize: 22.r, fontWeight: FontWeight.w700),
            ),
          ],
        );
      },
    );
  }

  // ------------------- SOURCE / LOAD TOGGLE -------------------
  Widget _sourceLoadToggle() {
    return Container(
      width: 254.w,
      height: 32.h,
      decoration: BoxDecoration(
        color: const Color(0xFFEEEEEE),
        borderRadius: BorderRadius.circular(16.r),
      ),
      child: Row(
        children: [
          _toggleBtn('Source', isSource, () {
            setState(() => isSource = true);
          }),
          _toggleBtn('Load', !isSource, () {
            setState(() => isSource = false);
          }),
        ],
      ),
    );
  }

  Widget _toggleBtn(String text, bool active, VoidCallback onTap) {
    return Expanded(
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          // margin: EdgeInsets.all(4.w),
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

  // ------------------- DATA SECTION -------------------
  Widget _dataSection() {
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
              onTap: () {
                context.goNamed(AppRoutes.data_scm);
              },
              child: _dataCard(
                'Data View',
                'assets/images/solar_cell.png',
                true,
                Icons.solar_power,
                Colors.blue,
                Color(0xFFE5F4FE),
              ),
            ),

            _dataCard(
              'Data Type 2',
              'assets/images/data_2.png',
              // 'assets/icons/data_two.svg',
              true,
              Icons.factory,
              Colors.orange,
              Color(0xFFE5F4FE),
            ),

            _dataCard(
              'Data Type 3',
              'assets/images/power.png',
              false,
              Icons.settings_input_component,
              Colors.blue,
              Color(0xFFE5F4FE),
            ),
            _dataCard(
              'Total Solar',
              'assets/images/solar_cell.png',
              true,
              Icons.factory,
              Colors.orange,
              Color(0xFFA5A7B9),
            ),
          ],
        ),
      ),
    );
  }

  Widget _dataCard(
    String title,
    String imagePath,
    bool active,
    IconData icon,
    Color iconColor,
    Color cardColor,
  ) {
    return Container(
      height: 71.h,
      // Fixed height from Figma
      margin: EdgeInsets.only(bottom: 8.h),
      // Gap from Figma
      padding: EdgeInsets.fromLTRB(8.w, 8.h, 8.w, 7.h),
      // Back to 8.w as in original
      decoration: BoxDecoration(
        color: cardColor,
        //color: active ? const Color(0xFFE5F4FE) : Color(0xFFA5A7B9),
        borderRadius: BorderRadius.circular(12.r),
        border: Border.all(color: Color(0xFFA5A7B9)),
      ),
      child: Row(
        children: [
          Image.asset(
            imagePath,
            width: 24.r,
            height: 24.r,
            fit: BoxFit.contain,
          ),
          Gap(12.w),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  children: [
                    Container(
                      width: 12,
                      height: 12,
                      decoration: BoxDecoration(
                        color: iconColor,
                        borderRadius: BorderRadius.circular(2.r),
                      ),
                    ),
                    Gap(8.w),
                    Text(
                      title,
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 14.r,
                        color: AppTheme.dataTitle,
                      ),
                    ),
                    Gap(14.w),
                    Text(
                      active ? '(Active)' : '(Inactive)',
                      style: TextStyle(
                        fontSize: 10.r,
                        color: active ? Colors.blue : Colors.red,
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
                        text: 'Data 1  : ', // first part
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                          color: Colors.grey.shade400,
                          fontSize: 12.r,
                        ),
                      ),
                      TextSpan(
                        text: '55505.63', // second part
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                          color: AppTheme.dataTitle, // different color
                          fontSize: 12.r,
                        ),
                      ),
                    ],
                  ),
                ),
                Text.rich(
                  TextSpan(
                    children: [
                      TextSpan(
                        text: 'Data 2  : ', // first part
                        style: TextStyle(
                          fontWeight: FontWeight.w400,
                          color: Colors.grey.shade400,
                          fontSize: 12.r,
                        ),
                      ),
                      TextSpan(
                        text: '58805.63', // second part
                        style: TextStyle(
                          fontWeight: FontWeight.w400,
                          color: Colors.blue, // different color
                          fontSize: 12.r,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Icon(
            Icons.keyboard_arrow_right,
            color: Color(0xFF646984),
            size: 34.r,
          ),
        ],
      ),
    );
  }

  // ================= BOTTOM GRID =================
  Widget _bottomGrid() {
    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: items.length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 3.2,
        mainAxisSpacing: 12.h,
        crossAxisSpacing: 12.w,
      ),
      itemBuilder: (_, i) {
        return Container(
          padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 12.h),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12.r),
            border: Border.all(color: Color(0xFFB6B8D0)),
          ),
          child: Row(
            children: [
              Image.asset(
                items[i]['image'] as String,
                width: 24.w,
                height: 24.h,
                fit: BoxFit.contain,
              ),
              Gap(8.w),
              Expanded(
                child: Text(
                  items[i]['name'] as String,
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 14.r,
                    color: Color(0xFF646984),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
