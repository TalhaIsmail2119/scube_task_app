import 'dart:ui';

import 'package:flutter/material.dart';

import 'data_card_model.dart';

final List<DataCardModel> cards = [
  DataCardModel(
    title: 'Data View',
    imagePath: 'assets/images/solar_cell.png',
    active: true,
    iconColor: Color(0xFF78C6FF),
    cardColor: Color(0xFFE5F4FE),
    data1Value: '55505.63',
    data2Value: '58805.63',
  ),
  DataCardModel(
    title: 'Data Type 2',
    imagePath: 'assets/images/data_2.png',
    active: true,
    iconColor: Color(0xFFFB902E),
    cardColor: Color(0xFFE5F4FE),
    data1Value: '55505.63',
    data2Value: '58805.63',
  ),
  DataCardModel(
    title: 'Data Type 3',
    imagePath: 'assets/images/power.png',
    active: false,
    iconColor: Color(0xFF78C6FF),
    cardColor: Color(0xFFE5F4FE),
    data1Value: '55505.63',
    data2Value: '58805.63',
  ),
  DataCardModel(
    title: 'Total Solar',
    imagePath: 'assets/images/solar_cell.png',
    active: true,
    iconColor: Colors.orange,
    cardColor: Color(0xFFF0F1FF),
    data1Value: ' 55505.63 kW',
    data2Value: ' 58805.63 kWh',
    data1Title: 'Live Power    :',
    data2Title: 'Today Energy :',
  ),
];