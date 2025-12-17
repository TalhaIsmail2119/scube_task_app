import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:scube_task_app/features/data_scm/widgets/energy_charts_card.dart';
import 'package:scube_task_app/features/data_scm/widgets/power_indicator.dart';
import '../data/data_cost_item.dart';
import '../data/enerfy_data_items.dart';
import '../screens/scm_data_screen.dart';
import 'data_cost_info_card.dart';
import 'date_search_row.dart';

class ScmBodyWidget extends StatefulWidget {
  final ScmViewType viewType;
  final DataRangeType dataRange;
  final ValueChanged<DataRangeType> onRangeChanged;

  const ScmBodyWidget({
    required this.viewType,
    required this.dataRange,
    required this.onRangeChanged,
  });

  @override
  State<ScmBodyWidget> createState() => _ScmBodyWidgetState();
}

class _ScmBodyWidgetState extends State<ScmBodyWidget> {
  double dataPercent = 55.00;
  double customDataPercent = 57.00;
  double revenueAmount = 8897455.00;

  @override
  Widget build(BuildContext context) {
    final isToday = widget.dataRange == DataRangeType.today;
    return Container(
      padding: EdgeInsets.only(left: 24.w, top: 58.h, right: 24.w),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20.r),
      ),
      child: Column(
        children: [

          if (widget.viewType == ScmViewType.data) ...[
            PowerIndicator(
              powerValue: isToday ? dataPercent : customDataPercent,
              min: 0,
              max: 90,
              angleRange: 240,
              startAngle: 150,
              centerValue: (isToday ? dataPercent : customDataPercent)
                  .toStringAsFixed(2),
              unitText: 'kWh/Sqft',
              onChanged: (value) {
                setState(() {
                  if (isToday) {
                    dataPercent = value;
                  } else {
                    customDataPercent = value;
                  }
                });
              },
            ),
            Padding(
              padding: EdgeInsets.only(left: 32.w, right: 34.w),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  GestureDetector(
                    onTap: () => widget.onRangeChanged(DataRangeType.today),
                    child: Row(
                      children: [
                        Icon(
                          Icons.circle,
                          size: 10.r,
                          color: widget.dataRange == DataRangeType.today
                              ? Colors.blue
                              : Colors.grey,
                        ),
                        Gap(4.w),
                        Text(
                          'Today Data',
                          style: TextStyle(
                            color: widget.dataRange == DataRangeType.today
                                ? Colors.blue
                                : Colors.grey,
                            fontWeight: widget.dataRange == DataRangeType.today
                                ? FontWeight.w600
                                : FontWeight.w400,
                            fontSize: 14.r,
                          ),
                        ),
                      ],
                    ),
                  ),
                  GestureDetector(
                    onTap: () => widget.onRangeChanged(DataRangeType.custom),
                    child: Row(
                      children: [
                        Icon(
                          Icons.circle,
                          size: 10.r,
                          color: widget.dataRange == DataRangeType.custom
                              ? Colors.blue
                              : Colors.grey,
                        ),
                        Gap(4.w),
                        Text(
                          'Custom Date Data',
                          style: TextStyle(
                            color: widget.dataRange == DataRangeType.custom
                                ? Colors.blue
                                : Colors.grey,
                            fontWeight: widget.dataRange == DataRangeType.custom
                                ? FontWeight.w600
                                : FontWeight.w400,
                            fontSize: 14.r,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            isToday? Gap(20.h) : Gap(8.h),

            // Custom Date Data -- Search Row
            if (widget.dataRange == DataRangeType.custom) ...[
              DateSearchRow(),
              Gap(6.h),
            ],
            EnergyChartCard(
              chartTitle: 'Energy Chart',
              powerValue: '5.53',
              items: const [
                EnergyDataItem(
                  title: 'Data A',
                  color: Colors.blue,
                  dataValue: '2798.50',
                  percentage: '29.53%',
                  cost: '35689 ৳',
                ),
                EnergyDataItem(
                  title: 'Data B',
                  color: Colors.lightBlue,
                  dataValue: '72598.50',
                  percentage: '35.39%',
                  cost: '5259689 ৳',
                ),
                EnergyDataItem(
                  title: 'Data C',
                  color: Colors.deepPurple,
                  dataValue: '6598.36',
                  percentage: '38.90%',
                  cost: '5698756 ৳',
                ),
                EnergyDataItem(
                  title: 'Data D',
                  color: Colors.orange,
                  dataValue: '6598.26',
                  percentage: '36.59%',
                  cost: '356987 ৳',
                ),
              ],
            ),

            /// ---------------- Custom Date Data  Section ----------------
            if (widget.dataRange == DataRangeType.custom) ...[
              Gap(12.h),
              EnergyChartCard(
                chartTitle: 'Energy Chart',
                powerValue: '5.53',
                items: const [
                  EnergyDataItem(
                    title: 'Data A',
                    color: Colors.red,
                    dataValue: '2798.50',
                    percentage: '29.53%',
                    cost: '35689 ৳',
                  ),
                  EnergyDataItem(
                    title: 'Data B',
                    color: Colors.lightBlue,
                    dataValue: '72598.50',
                    percentage: '35.39%',
                    cost: '5259689 ৳',
                  ),
                  EnergyDataItem(
                    title: 'Data C',
                    color: Colors.purple,
                    dataValue: '6598.36',
                    percentage: '38.90%',
                    cost: '5698756 ৳',
                  ),
                  EnergyDataItem(
                    title: 'Data D',
                    color: Colors.orange,
                    dataValue: '6598.26',
                    percentage: '36.59%',
                    cost: '356987 ৳',
                  ),
                ],
              ),
              Gap(50.h),
            ],
          ]

          /// ---------------- Revenue View ---------------------------
          else ...[
            PowerIndicator(
              powerValue: revenueAmount,
              min: 1000000,
              max: 11500000,
              angleRange: 240,
              startAngle: 150,
              centerValue: revenueAmount.round().toString(),
              unitText: 'tk',
              onChanged: (value) {
                setState(() {
                  revenueAmount = value;
                });
              },
            ),
            // const SizedBox(height: 24),
            DataCostInfoCard(
              items: [
                DataCostItem(
                  dataLabel: 'Data 1',
                  dataValue: '2798.50',
                  percentage: '29.53',
                  costLabel: 'Cost 1',
                  costValue: '35689',
                ),
                DataCostItem(
                  dataLabel: 'Data 2',
                  dataValue: '2798.50',
                  percentage: '29.53',
                  costLabel: 'Cost 2',
                  costValue: '35689',
                ),
                DataCostItem(
                  dataLabel: 'Data 3',
                  dataValue: '2798.50',
                  percentage: '29.53',
                  costLabel: 'Cost 3',
                  costValue: '35689',
                ),
                DataCostItem(
                  dataLabel: 'Data 4',
                  dataValue: '2798.50',
                  percentage: '29.53',
                  costLabel: 'Cost 4',
                  costValue: '35689',
                ),
              ],
            ),
          ],
        ],
      ),
    );
  }
}
