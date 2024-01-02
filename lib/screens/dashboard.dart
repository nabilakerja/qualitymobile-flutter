import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:hki_quality/widget/appbar_theme.dart';

class Dashboard extends StatelessWidget {
  const Dashboard({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: CustomAppBar(
        title: 'Dashboard',
        
      ),
        body: Container(
          padding: const EdgeInsets.only(top: 30,right: 15,left: 25),
          width: 500,
          height: 400,
          child: Center(
            child: LineChart(
              LineChartData(
                lineBarsData: [
                  LineChartBarData(
                    spots: [
                      const FlSpot(0, 3),
                      const FlSpot(1, 1),
                      const FlSpot(2, 4),
                      const FlSpot(3, 2),
                      // ... tambahkan data sesuai kebutuhan
                    ],
                    isCurved: true,
                    colors: [Colors.blue],
                    dotData: FlDotData(show: false),
                    belowBarData: BarAreaData(show: false),
                  ),
                ],
                titlesData: FlTitlesData(
                  leftTitles: SideTitles(showTitles: true),
                  bottomTitles: SideTitles(showTitles: true),
                ),
                borderData: FlBorderData(show: true),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
