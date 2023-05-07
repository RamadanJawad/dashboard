import 'package:dashboard/constant/responsive.dart';
import 'package:dashboard/data/my_data.dart';
import 'package:dashboard/widgets/custom_card.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class LineChartCard extends StatelessWidget {
  LineChartCard({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Steps Overview",
            style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
          ),
          const SizedBox(
            height: 20,
          ),
          AspectRatio(
            aspectRatio: Responsive.isMobile(context) ? 9 / 4 : 16 / 6,
            child: LineChart(
              LineChartData(
                lineTouchData: LineTouchData(
                  handleBuiltInTouches: true,
                ),
                gridData: FlGridData(show: false),
                titlesData: FlTitlesData(
                  bottomTitles: AxisTitles(
                    sideTitles: SideTitles(
                      showTitles: true,
                      reservedSize: 32,
                      interval: 1,
                      getTitlesWidget: (double value, TitleMeta meta) {
                        return bottomTitle[value.toInt()] != null
                            ? SideTitleWidget(
                                axisSide: meta.axisSide,
                                space: 10,
                                child: Text(
                                    bottomTitle[value.toInt()].toString(),
                                    style: TextStyle(
                                        fontSize: Responsive.isMobile(context)
                                            ? 9
                                            : 12,
                                        color: Colors.grey[400])),
                              )
                            : const SizedBox();
                      },
                    ),
                  ),
                  rightTitles: AxisTitles(
                    sideTitles: SideTitles(showTitles: false),
                  ),
                  topTitles: AxisTitles(
                    sideTitles: SideTitles(showTitles: false),
                  ),
                  leftTitles: AxisTitles(
                    sideTitles: SideTitles(
                      getTitlesWidget: (double value, TitleMeta meta) {
                        return leftTitle[value.toInt()] != null
                            ? Text(leftTitle[value.toInt()].toString(),
                                style: TextStyle(
                                    fontSize:
                                        Responsive.isMobile(context) ? 9 : 12,
                                    color: Colors.grey[400]))
                            : const SizedBox();
                      },
                      showTitles: true,
                      interval: 1,
                      reservedSize: 40,
                    ),
                  ),
                ),
                borderData: FlBorderData(show: false),
                lineBarsData: [
                  LineChartBarData(
                      isCurved: true,
                      curveSmoothness: 0,
                      color: Theme.of(context).primaryColor,
                      barWidth: 2.5,
                      isStrokeCapRound: true,
                      belowBarData: BarAreaData(
                        gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [
                            Theme.of(context).primaryColor.withOpacity(0.5),
                            Colors.transparent
                          ],
                        ),
                        show: true,
                        color: Theme.of(context).primaryColor.withOpacity(0.5),
                      ),
                      dotData: FlDotData(show: false),
                      spots: spots)
                ],
                minX: 0,
                maxX: 120,
                maxY: 105,
                minY: -5,
              ),
              swapAnimationDuration: const Duration(milliseconds: 250),
            ),
          ),
        ],
      ),
    );
  }
}
