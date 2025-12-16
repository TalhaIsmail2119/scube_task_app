import 'dart:ui';

class EnergyDataItem {
  final String title;
  final Color color;
  final String dataValue;
  final String percentage;
  final String cost;

  const EnergyDataItem({
    required this.title,
    required this.color,
    required this.dataValue,
    required this.percentage,
    required this.cost,
  });
}