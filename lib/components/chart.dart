import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:trash_squad/controllers/points_controller.dart';
import 'package:trash_squad/models/points_model.dart';

class ChartWidget extends StatefulWidget {
  const ChartWidget({super.key});

  @override
  State<ChartWidget> createState() => _ChartWidgetState();
}

class _ChartWidgetState extends State<ChartWidget> {
  final PointsController _pointsController = PointsController();
  late Future<List<Points>> _points;

  @override
  void initState() {
    super.initState();
    _points = _pointsController.fetchPoints();
  }

  @override
  Widget build(BuildContext context) {
    // Sample data points for the chart
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
      height: 340,
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
          side: const BorderSide(color: Color(0xFF086C74), width: 2),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: FutureBuilder<List<Points>>(
            future: _points,
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(child: CircularProgressIndicator());
              } else if (snapshot.hasError) {
                return Center(child: Text("Error: ${snapshot.error}"));
              } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                return const Center(child: Text("No activities available."));
              } else {
                List<Points> points = snapshot.data!;
                return Column(
                  children: [
                    Expanded(
                      child: ListView.separated(
                        itemCount: points.length,
                        separatorBuilder: (context, index) => const Divider(),
                        itemBuilder: (context, index) {
                          return Row(
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
                                    points[index].totalPoints.toString(),
                                    style: const TextStyle(
                                      fontSize: 24,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 4),
                                    child: Text(
                                      '\$${points[index].cashEquivalent}',
                                      style: TextStyle(
                                        fontSize: 16,
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
                          );
                        },
                      ),
                    ),
                    const SizedBox(height: 16),
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
                              color: const Color(0xFFD946EF),
                              barWidth: 2,
                              isStrokeCapRound: true,
                              dotData: FlDotData(show: false),
                              belowBarData: BarAreaData(
                                show: true,
                                gradient: LinearGradient(
                                  colors: [
                                    const Color(0xFFD946EF).withOpacity(0.8),
                                    const Color(0xFFD946EF).withOpacity(0.2),
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
                );
              }
            },
          ),
        ),
      ),
    );
  }
}
