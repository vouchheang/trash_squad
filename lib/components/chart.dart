import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';

class ChartWidget extends StatelessWidget {
  const ChartWidget({super.key});

  @override
  Widget build(BuildContext context) {
    // Sample data points - replace with your actual data
    final List<FlSpot> spots = [
      FlSpot(0, 4),
      FlSpot(1, 3),
      FlSpot(2, 6),
      FlSpot(3, 8),
      FlSpot(4, 5),
      FlSpot(5, 9),
      FlSpot(6, 4),
      FlSpot(7, 7),
      FlSpot(8, 7),
      FlSpot(9, 8),
    ];

    return SizedBox(
        height: 325,
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
          
          // ignore: deprecated_member_use
          side: BorderSide(color: Color(0xFF086C74), width: 2),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Total Points:',
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.grey[600],
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        '1,280',
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left:6),
                        child: Text(
                          '\$550.21',
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.green[500],
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ],
                  ),
                  Text(
                    '> 13.4%',
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.green[500],
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 200,
                child: LineChart(
                  LineChartData(
                    gridData: FlGridData(show: false),
                    titlesData: FlTitlesData(show: false),
                    borderData: FlBorderData(show: false),
                    lineBarsData: [
                      LineChartBarData(
                        spots: spots,
                        isCurved: true,
                        color: Color(0xFFD946EF),
                        barWidth: 2,
                        isStrokeCapRound: true,
                        dotData: FlDotData(show: false),
                        belowBarData: BarAreaData(
                          show: true,
                          gradient: LinearGradient(
                            colors: [
                              // ignore: deprecated_member_use
                              Color(0xFFD946EF).withOpacity(0.8),
                              Color(0xFFD946EF).withValues(alpha: 0.2),
                            ],
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                          ),
                        ),
                      ),
                    ],
                    lineTouchData: LineTouchData(enabled: false),
                    minX: 0,
                    maxX: 9,
                    minY: 0,
                    maxY: 10,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}