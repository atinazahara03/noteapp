import 'package:flutter/material.dart';

import '../theme/app_theme.dart';

class SummaryCard extends StatelessWidget {
  const SummaryCard({
    super.key,
    required this.total,
    required this.today,
    required this.important,
  });

  final int total;
  final int today;
  final int important;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 18, horizontal: 8),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [AppColors.primary, AppColors.primaryDark],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        children: [
          Expanded(child: _Stat(value: total, label: 'Total catatan')),
          const _Divider(),
          Expanded(child: _Stat(value: today, label: 'Hari ini')),
          const _Divider(),
          Expanded(child: _Stat(value: important, label: 'Penting')),
        ],
      ),
    );
  }
}

class _Stat extends StatelessWidget {
  const _Stat({required this.value, required this.label});

  final int value;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          '$value',
          style: const TextStyle(
            color: Colors.white,
            fontSize: 24,
            fontWeight: FontWeight.w700,
          ),
        ),
        const SizedBox(height: 2),
        Text(label, style: const TextStyle(color: Colors.white70, fontSize: 11)),
      ],
    );
  }
}

class _Divider extends StatelessWidget {
  const _Divider();

  @override
  Widget build(BuildContext context) =>
      Container(width: 1, height: 32, color: Colors.white24);
}