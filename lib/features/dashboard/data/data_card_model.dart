import 'dart:ui';

class DataCardModel {
  final String title;
  final String imagePath;
  final bool active;
  final Color iconColor;
  final Color cardColor;
  final String data1Value;
  final String data2Value;
  final String? data1Title;
  final String? data2Title;

  DataCardModel({
    required this.title,
    required this.imagePath,
    required this.active,
    required this.iconColor,
    required this.cardColor,
    required this.data1Value,
    required this.data2Value,
    this.data1Title,
    this.data2Title,
  });
}
