import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class ChartEx extends StatelessWidget {
  const ChartEx({Key? key}) : super(key: key);

  static List<BarChartGroupData> data = [
    BarChartGroupData(
      x: 0,
      barRods: [
        BarChartRodData(
          fromY: 0,
          color: Colors.blue, toY: 10,
        ),
      ],
    ),
    BarChartGroupData(
      x: 5,
      barRods: [
        BarChartRodData(
          fromY: 4,
          color: Colors.green, toY: 13,
        ),
      ],
    ),
    BarChartGroupData(
      x: 10,
      barRods: [
        BarChartRodData(
          fromY: 0,
          color: Colors.orange, toY: 12,
        ),
      ],
    ),
    // Add more data points as needed
  ];


  @override
  Widget build(BuildContext context) {
    return BarChart(
      BarChartData(
        maxY: 20,
        alignment: BarChartAlignment.spaceAround,
        barTouchData: BarTouchData(
            enabled: true,
            longPressDuration: const Duration(seconds: 3),
            touchTooltipData: BarTouchTooltipData(
              tooltipBgColor: Colors.cyanAccent,
            )
        ),
        titlesData: const FlTitlesData(
          show: true,

        ),
        borderData: FlBorderData(show: false),
        barGroups: data,
      ),
    );
  }
}
