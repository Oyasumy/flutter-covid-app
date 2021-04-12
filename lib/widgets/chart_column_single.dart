import 'package:covid_app/config/styles.dart';
import 'package:covid_app/data/data.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class ChartColumnSingle extends StatefulWidget {
  @override
  _CountriesScreenState createState() => _CountriesScreenState();
}

class _CountriesScreenState extends State<ChartColumnSingle> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BarChart(BarChartData(
        maxY: 70,
        alignment: BarChartAlignment.spaceAround,
        barTouchData: BarTouchData(enabled: false),
        titlesData: FlTitlesData(
            show: true,
            bottomTitles: SideTitles(
                margin: 10,
                showTitles: true,
                getTextStyles: (value) => Styles.chartLabelTextStyle,
                rotateAngle: 35,
                getTitles: (double value) {
                  switch (value.toInt()) {
                    case 0:
                      return "May 24";
                    case 1:
                      return "May 25";
                    case 2:
                      return "May 26";
                    case 3:
                      return "May 27";
                    case 4:
                      return "May 28";
                    case 5:
                      return "May 29";
                    case 6:
                      return "May 30";
                    case 7:
                      return "May 31";
                    default:
                      return "q";
                  }
                }),
            leftTitles: SideTitles(
                margin: 10,
                showTitles: true,
                getTextStyles: (value) => Styles.chartLabelTextStyle,
                getTitles: (value) {
                  if (value == 0) {
                    return "0";
                  }
                  if (value % 10 == 0) {
                    return '${value ~/ 10 * 10}K';
                  }
                  return "";
                })),
        gridData: FlGridData(
            show: true,
            checkToShowHorizontalLine: (value) => value % 5 == 0,
            getDrawingHorizontalLine: (value) =>
                FlLine(color: Colors.black12, strokeWidth: 1, dashArray: [5])),
        borderData: FlBorderData(show: false),
        barGroups: covidUSADailyNewCases
            .asMap()
            .map((key, value) => MapEntry(
                key,
                BarChartGroupData(x: key, barRods: [
                  BarChartRodData(y: value.toDouble(), colors: [Colors.red])
                ])))
            .values
            .toList()));
  }
}
