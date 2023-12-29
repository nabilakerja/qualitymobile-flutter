import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:hki_quality/widget/appbar_theme.dart';

class Dashboard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: CustomAppBar(
        title: 'Dashboard',
        
      ),
        body: Container(
          padding: EdgeInsets.only(top: 30,right: 15,left: 25),
          width: 500,
          height: 400,
          child: Center(
            child: LineChart(
              LineChartData(
                lineBarsData: [
                  LineChartBarData(
                    spots: [
                      FlSpot(0, 3),
                      FlSpot(1, 1),
                      FlSpot(2, 4),
                      FlSpot(3, 2),
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
