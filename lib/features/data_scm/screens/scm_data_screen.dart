import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../widgets/scm_body_widget.dart';
import '../widgets/data_revenue_toggle.dart';

enum ScmViewType { data, revenue }
enum DataRangeType { today, custom }

class ScmScreen extends StatefulWidget {
  const ScmScreen({super.key});

  @override
  State<ScmScreen> createState() => _ScmScreenState();
}

class _ScmScreenState extends State<ScmScreen> {
  ScmViewType viewType = ScmViewType.data;
  DataRangeType dataRange = DataRangeType.today;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        leading: const BackButton(color: Colors.black),
        title: const Text(
          'SCM',
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.w600),
        ),
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 16),
            child: Icon(Icons.notifications_none, color: Colors.black),
          ),
        ],
      ),
      body: Stack(
        clipBehavior: Clip.none,
        children: [
          Positioned.fill(
            top: 40.h,
            child: SingleChildScrollView(
              child: ConstrainedBox(
                constraints: BoxConstraints(
                  minHeight:
                  MediaQuery.of(context).size.height - kToolbarHeight - 40.h,
                ),
                child: ScmBodyWidget(
                  viewType: viewType,
                  dataRange: dataRange,
                  onRangeChanged: (v) {
                    setState(() => dataRange = v);
                  },
                ),
              ),
            ),
          ),
          // Toggle above card
          Positioned(
            top: 16.h,
            left: 24,
            right: 24,
            child: DataRevenueToggle(
              value: viewType,
              onChanged: (v) {
                setState(() => viewType = v);
              },
            ),
          ),
        ],
      ),
    );
  }
}



