import 'package:flutter/material.dart';
// import 'package:easy_localization/easy_localization.dart';
import 'bento_stat_item.dart';

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

  String _formatBookingModel(String raw) {
    if (raw.trim().isEmpty) return 'Standard';
    return raw.replaceAll('_', ' ').toUpperCase();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
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
              label: 'Duration', // مستقبلاً: 'duration'.tr()
              value: durationText,
            ),
          ),
          Container(width: 1, height: 44, color: const Color(0xFFECEEF0)),
          Expanded(
            child: BentoStatItem(
              icon: Icons.date_range_outlined,
              label: 'Dates', // مستقبلاً: 'dates'.tr()
              value: datesText,
            ),
          ),
          Container(width: 1, height: 44, color: const Color(0xFFECEEF0)),
          Expanded(
            child: BentoStatItem(
              icon: Icons.verified_outlined,
              label:
                  'Booking', // خففنا الكلمة لـ Booking لتفادي الضغط على المساحة
              value: _formatBookingModel(bookingModelText),
            ),
          ),
        ],
      ),
    );
  }
}
