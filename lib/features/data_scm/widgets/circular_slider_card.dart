import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:scube_task_app/features/data_scm/widgets/energy_charts_card.dart';
import 'package:scube_task_app/features/data_scm/widgets/power_indicator.dart';
import '../data/data_cost_item.dart';
import '../data/enerfy_data_items.dart';
import '../screens/scm_data_screen.dart';
import 'data_cost_info_card.dart';


class CircularSliderCard extends StatefulWidget {
  final ScmViewType viewType;
  final DataRangeType dataRange;
  final ValueChanged<DataRangeType> onRangeChanged;

  const CircularSliderCard({
    required this.viewType,
    required this.dataRange,
    required this.onRangeChanged,
  });

  @override
  State<CircularSliderCard> createState() => _CircularSliderCardState();
}

class _CircularSliderCardState extends State<CircularSliderCard> {
  double powerPercent = 55.00;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding:EdgeInsets.only(left: 24.w,top: 58.h,right: 24.w),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20.r),
      ),
      child: Column(
        children: [
          PowerIndicator(
            powerValue: powerPercent,
            onChanged: (value) {
              setState(() => powerPercent = value);
            },
          ),
          Gap(40.h),

          if (widget.viewType == ScmViewType.data) ...[
            Padding(
              padding:  EdgeInsets.only(left: 32.w,right:34.w ),
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
            Gap(20.h),

            // Custom Date Data -- Search Row
            if (widget.dataRange == DataRangeType.custom) ...[
              const SizedBox(height: 16),
              Container(
                height: 120,
                width: double.infinity,
                margin:
                const EdgeInsets.symmetric(horizontal: 24),
                decoration: BoxDecoration(
                  color: Colors.red,
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ],
            Gap(20.h),

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

            /// Custom Data Data Enable Section
            if (widget.dataRange == DataRangeType.custom) ...[
              Gap(20.h),
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
            ],
          ]

          /// ---------------- Revenue View ---------------------------
          else ...[
            const SizedBox(height: 24),
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
            Gap(24.h),
            Container(
              height: 160.h,
              width: double.infinity,
              margin:
              const EdgeInsets.symmetric(horizontal: 24),
              decoration: BoxDecoration(
                color: Colors.blue,
                borderRadius: BorderRadius.circular(12),
              ),
            ),
          ],
        ],
      ),
    );
  }
}