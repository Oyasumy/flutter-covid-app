import 'package:covid_app/config/styles.dart';
import 'package:covid_app/data/data.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class ChartColumnDouble extends StatefulWidget {
  @override
  _CountriesScreenState createState() => _CountriesScreenState();
}

class _CountriesScreenState extends State<ChartColumnDouble> {
  final Color leftBarColor = const Color(0xff53fdd7);
  final Color rightBarColor = const Color(0xffff5182);
  final double width = 7;

  List<BarChartGroupData> rawBarGroups;
  List<BarChartGroupData> showingBarGroups;

  @override
  void initState() {
    super.initState();
    final barGroup1 = makeGroupData(0, 5, 12);
    final barGroup2 = makeGroupData(1, 16, 12);
    final barGroup3 = makeGroupData(2, 18, 5);
    // final barGroup4 = makeGroupData(3, 20, 16);
    // final barGroup5 = makeGroupData(4, 17, 6);
    // final barGroup6 = makeGroupData(5, 19, 1.5);
    // final barGroup7 = makeGroupData(6, 10, 1.5);

    final items = [
      barGroup1,
      barGroup2,
      barGroup3,
      // barGroup4,
      // barGroup5,
      // barGroup6,
      // barGroup7,
    ];

    rawBarGroups = items;

    showingBarGroups = rawBarGroups;
  }

  BarChartGroupData makeGroupData(int x, double y1, double y2) {
    return BarChartGroupData(barsSpace: 4, x: x, barRods: [
      BarChartRodData(
        y: y1,
        colors: [leftBarColor],
        width: width,
      ),
      BarChartRodData(
        y: y2,
        colors: [rightBarColor],
        width: width,
      ),
    ]);
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
              getTextStyles: (v) => Styles.chartLabelTextStyle,
              // rotateAngle: 35,
              getTitles: (double value) {
                switch (value.toInt()) {
                  case 0:
                    return "TD Cases\nCases";
                  case 1:
                    return "TD Deaths\nDeaths";
                  case 2:
                    return "TD Recovered\nRecovered";
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
              getTextStyles: (v) => Styles.chartLabelTextStyle,
              getTitles: (value) {
                if (value == 0) {
                  return "0";
                }
                if (value % 10 == 0) {
                  return '${value ~/ 10 * 10}K';
                }
                return "";
              }),
          rightTitles: SideTitles(showTitles: false)),
      gridData: FlGridData(
          show: true,
          checkToShowHorizontalLine: (value) => value % 5 == 0,
          getDrawingHorizontalLine: (value) =>
              FlLine(color: Colors.black12, strokeWidth: 1, dashArray: [5])),
      borderData: FlBorderData(show: false),
      barGroups: showingBarGroups,
    ));
  }
}
