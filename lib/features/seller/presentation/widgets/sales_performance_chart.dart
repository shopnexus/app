import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:shopnexus_flutter_app/api/generated/model/order_summary_day.dart';
import 'package:shopnexus_flutter_app/core/theme/app_colors.dart';

/// Orders placed per day over the dashboard's window. Counts only: the summary
/// carries money per currency, and one line mixing currencies would be a figure
/// that means nothing.
class SalesPerformanceChart extends StatelessWidget {
  /// Only the days that had an order, as the contract sends them. A window with
  /// no sale draws nothing rather than a made-up curve.
  final List<OrderSummaryDay> days;

  const SalesPerformanceChart({super.key, required this.days});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    final spots = [
      for (final (index, day) in days.indexed)
        FlSpot(index.toDouble(), day.placed.toDouble()),
    ];

    double maxY = spots.fold(0.0, (max, spot) => spot.y > max ? spot.y : max);
    if (maxY == 0) maxY = 1;
    maxY = (maxY * 1.25).ceilToDouble();

    final labelInterval = (days.length / 6)
        .ceil()
        .clamp(1, days.length)
        .toDouble();

    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: isDark ? AppColors.darkSurface : Colors.white,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          color: isDark
              ? AppColors.darkPrimary.withValues(alpha: 0.15)
              : const Color(0xFFE2E8F0),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.03),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Đơn đặt theo ngày',
                style: theme.textTheme.titleMedium?.copyWith(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                  fontFamily: 'Manrope',
                  color: theme.colorScheme.onSurface,
                ),
              ),
              const SizedBox(height: 2),
              Text(
                'Chỉ những ngày có đơn',
                style: theme.textTheme.bodySmall?.copyWith(
                  color: theme.colorScheme.onSurfaceVariant,
                  fontFamily: 'Inter',
                ),
              ),
            ],
          ),
          const SizedBox(height: 24),
          if (days.isEmpty)
            SizedBox(
              height: 180,
              child: Center(
                child: Text(
                  'Chưa có đơn nào trong khoảng thời gian này',
                  style: theme.textTheme.bodySmall?.copyWith(
                    color: theme.colorScheme.onSurfaceVariant,
                    fontFamily: 'Inter',
                  ),
                ),
              ),
            )
          else
            SizedBox(
              height: 180,
              child: LineChart(
                LineChartData(
                  gridData: FlGridData(
                    show: true,
                    drawVerticalLine: false,
                    horizontalInterval: maxY / 3,
                    getDrawingHorizontalLine: (value) {
                      return FlLine(
                        color: isDark
                            ? AppColors.darkPrimary.withValues(alpha: 0.1)
                            : const Color(0xFFF1F5F9),
                        strokeWidth: 1,
                      );
                    },
                  ),
                  titlesData: FlTitlesData(
                    show: true,
                    rightTitles: const AxisTitles(
                      sideTitles: SideTitles(showTitles: false),
                    ),
                    topTitles: const AxisTitles(
                      sideTitles: SideTitles(showTitles: false),
                    ),
                    leftTitles: const AxisTitles(
                      sideTitles: SideTitles(showTitles: false),
                    ),
                    bottomTitles: AxisTitles(
                      sideTitles: SideTitles(
                        showTitles: true,
                        reservedSize: 44,
                        // A year's window is 366 buckets, so only every nth day is
                        // labelled — one label per bucket is unreadable.
                        interval: labelInterval,
                        getTitlesWidget: (value, meta) {
                          final index = value.toInt();
                          if (index < 0 || index >= days.length) {
                            return const SizedBox.shrink();
                          }
                          final day = days[index];
                          return Padding(
                            padding: const EdgeInsets.only(top: 4.0),
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Text(
                                  day.placed.toString(),
                                  style: TextStyle(
                                    fontSize: 12,
                                    fontWeight: FontWeight.bold,
                                    fontFamily: 'Inter',
                                    color: theme.colorScheme.onSurface,
                                  ),
                                ),
                                const SizedBox(height: 2),
                                Text(
                                  _dayMonth(day.date),
                                  style: TextStyle(
                                    fontSize: 10,
                                    fontWeight: FontWeight.w500,
                                    fontFamily: 'Inter',
                                    color: theme.colorScheme.onSurfaceVariant,
                                  ),
                                ),
                              ],
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                  borderData: FlBorderData(show: false),
                  minX: 0,
                  maxX: (days.length - 1).toDouble(),
                  minY: 0,
                  maxY: maxY,
                  lineBarsData: [
                    LineChartBarData(
                      spots: spots,
                      isCurved: true,
                      curveSmoothness: 0.35,
                      color: theme.colorScheme.primary,
                      barWidth: 3,
                      isStrokeCapRound: true,
                      dotData: FlDotData(
                        show: true,
                        getDotPainter: (spot, percent, barData, index) {
                          return FlDotCirclePainter(
                            radius: 5,
                            color: theme.colorScheme.primary,
                            strokeWidth: 2,
                            strokeColor: isDark
                                ? AppColors.darkSurface
                                : Colors.white,
                          );
                        },
                      ),
                      belowBarData: BarAreaData(
                        show: true,
                        gradient: LinearGradient(
                          colors: [
                            theme.colorScheme.primary.withValues(alpha: 0.25),
                            theme.colorScheme.primary.withValues(alpha: 0.0),
                          ],
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
        ],
      ),
    );
  }

  /// `2026-08-05` as `05/08`. A bucket is a local date in the requested zone, so
  /// it is split rather than parsed into an instant somebody could re-convert.
  static String _dayMonth(String date) {
    final parts = date.split('-');
    return parts.length == 3 ? '${parts[2]}/${parts[1]}' : date;
  }
}
