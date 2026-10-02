import 'package:flutter/material.dart';
import 'package:rehletna_mobile/features/tour_detail/presentation/widgets/bento_stat_item.dart';

class QuickStatsBento extends StatelessWidget {
  final String durationText;
  final String datesText;
  final String bookingModelText;

  const QuickStatsBento({
    super.key,
    required this.durationText,
    required this.datesText,
    required this.bookingModelText,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: const Color(0xFF0F1C2C).withValues(alpha: 0.06),
            blurRadius: 20,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Row(
        children: [
          Expanded(
            child: BentoStatItem(
              icon: Icons.calendar_today_outlined,
              label: 'Duration',
              value: durationText,
            ),
          ),
          Container(width: 1, height: 48, color: const Color(0xFFECEEF0)),
          Expanded(
            child: BentoStatItem(
              icon: Icons.date_range_outlined,
              label: 'Dates',
              value: datesText,
            ),
          ),
          Container(width: 1, height: 48, color: const Color(0xFFECEEF0)),
          Expanded(
            child: BentoStatItem(
              icon: Icons.verified_outlined,
              label: 'Booking Model',
              value: bookingModelText.toUpperCase(),
            ),
          ),
        ],
      ),
    );
  }
}
