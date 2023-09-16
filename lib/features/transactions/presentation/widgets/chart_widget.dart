import 'package:flutter/material.dart';

import 'package:fl_chart/fl_chart.dart';
import 'package:personal_finance/config/theme/app_theme.dart';
import 'package:personal_finance/core/util/constants.dart';
import 'package:personal_finance/features/transactions/domain/entities/transaction.dart';

class ChartWidget extends StatelessWidget {
  final List<TransactionEntity>? transactions;

  const ChartWidget(this.transactions, {super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 4,
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(color: borderColor),
          borderRadius: const BorderRadius.all(borderRadius),
        ),
        padding: const EdgeInsets.all(16.0),
        child: LineChart(_createChartData()),
      ),
    );
  }

  LineChartData _createChartData() {
    final now = DateTime.now();

    Map<int, double> amounts = {};
    double currentAmount = 0;
    double lastAmount = 0;

    for (var i = transactions!.length - 1; i >= 0; i--) {
      currentAmount += transactions![i].amount!;

      final transactionDate = dateFormat.parse(transactions![i].date ?? '');
      if (transactionDate.month == now.month) {
        amounts[transactionDate.day] = currentAmount;
      } else {
        lastAmount = currentAmount;
      }
    }

    final List<FlSpot> spots = [];
    for (double i = 1; i <= DateTime.now().day; i++) {
      lastAmount = amounts[i] ?? lastAmount;
      spots.add(FlSpot(i, lastAmount));
    }

    return LineChartData(
      gridData: const FlGridData(
        drawHorizontalLine: false,
      ),
      borderData: FlBorderData(show: false),
      titlesData: FlTitlesData(
        rightTitles: const AxisTitles(
          sideTitles: SideTitles(showTitles: false),
        ),
        topTitles: const AxisTitles(
          sideTitles: SideTitles(showTitles: false),
        ),
        leftTitles: const AxisTitles(
          axisNameWidget: Text('\$', style: chartAxisTitleTheme),
          axisNameSize: 40,
          sideTitles: SideTitles(
            showTitles: true,
            reservedSize: 50,
          ),
        ),
        bottomTitles: AxisTitles(
          axisNameWidget: const Text('Date', style: chartAxisTitleTheme),
          axisNameSize: 40,
          sideTitles: SideTitles(
            showTitles: true,
            interval: 1,
            reservedSize: 25,
            getTitlesWidget: (value, meta) => SideTitleWidget(
              axisSide: meta.axisSide,
              fitInside: SideTitleFitInsideData(
                distanceFromEdge: 10,
                axisPosition: meta.axisPosition,
                enabled: true,
                parentAxisSize: meta.parentAxisSize,
              ),
              child: Text(
                '${value.toInt().toString().padLeft(2, '0')}-${(now.month + 1).toString().padLeft(2, '0')}',
              ),
            ),
          ),
        ),
      ),
      minY: 0,
      lineBarsData: [
        LineChartBarData(
          spots: spots,
          isCurved: true,
          preventCurveOverShooting: true,
          curveSmoothness: .5,
        ),
      ],
    );
  }
}
