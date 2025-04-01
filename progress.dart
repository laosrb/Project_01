import 'package:flutter/material.dart';

class ProgressScreen extends StatelessWidget {
  final Map<DateTime, int> taskCompletionCount;

  const ProgressScreen({
    Key? key,
    required this.taskCompletionCount,
  }) : super(key: key);

  Color _getHeatmapColor(int count) {
    if (count == 0) return Colors.grey[300]!;
    if (count == 1) return Colors.green[100]!;
    if (count == 2) return Colors.green[300]!;
    if (count == 3) return Colors.green[500]!;
    if (count >= 4) return Colors.green[700]!;
    return Colors.green[900]!;
  }

  @override
  Widget build(BuildContext context) {
    final now = DateTime.now();
    final startDate = now.subtract(const Duration(days: 29)); // Last 30 days

    // Generate all days in the 30-day window
    final days = <DateTime>[];
    for (int i = 0; i < 30; i++) {
      days.add(DateTime.utc(startDate.year, startDate.month, startDate.day + i));
    }

    return Scaffold(
      appBar: AppBar(title: const Text('Progress')),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Date range header
              Padding(
                padding: const EdgeInsets.only(bottom: 16.0),
                child: Text(
                  '30-Day Progress',
                  style: Theme.of(context).textTheme.headlineSmall,
                ),
              ),
              
              // Heatmap
              Wrap(
                spacing: 8,
                runSpacing: 8,
                children: days.map((day) {
                  DateTime normalizedDay = DateTime.utc(day.year, day.month, day.day);
                  int count = taskCompletionCount[normalizedDay] ?? 0; // Default to 0

                  // Debugging print to check task count
                  print('Date: ${_formatDate(normalizedDay)}, Task Count: $count');

                  return Tooltip(
                    message: '${_formatDate(normalizedDay)}\nTasks completed: $count',
                    child: Container(
                      width: 36,
                      height: 36,
                      decoration: BoxDecoration(
                        color: _getHeatmapColor(count),
                        borderRadius: BorderRadius.circular(4),
                      ),
                      child: Center(
                        child: Text(
                          '${normalizedDay.day}',
                          style: TextStyle(
                            color: count > 0 ? Colors.white : Colors.grey[700],
                            fontWeight: FontWeight.bold,
                            fontSize: 12,
                          ),
                        ),
                      ),
                    ),
                  );
                }).toList(),
              ),
              
              // Legend
              Padding(
                padding: const EdgeInsets.only(top: 16.0),
                child: Row(
                  children: [
                    const Text('Less '),
                    _buildLegendItem(1),
                    _buildLegendItem(2),
                    _buildLegendItem(3),
                    _buildLegendItem(4),
                    const Text(' More'),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  String _formatDate(DateTime date) {
    return '${date.day}/${date.month}';
  }

  Widget _buildLegendItem(int level) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 4.0),
      child: Container(
        width: 16,
        height: 16,
        decoration: BoxDecoration(
          color: _getHeatmapColor(level),
          borderRadius: BorderRadius.circular(2),
        ),
      ),
    );
  }
}
