import 'package:flutter/material.dart';
import 'package:rehletna_mobile/features/tour_detail/data/models/segment_model.dart';
import 'package:rehletna_mobile/features/tour_detail/domain/extensions/tour_processing_extensions.dart';

class SegmentItemCardWidget extends StatelessWidget {
  final SegmentModel segment;
  final int counter;

  const SegmentItemCardWidget({
    super.key,
    required this.segment,
    required this.counter,
  });

  @override
  Widget build(BuildContext context) {
    final bool hasDuration = segment.durationText.trim().isNotEmpty;
    final bool hasDates =
        segment.startDate!.trim().isNotEmpty ||
        segment.endDate!.trim().isNotEmpty;

    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: const Color(0xFF0F1C2C).withValues(alpha: 0.05),
            blurRadius: 20,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 36,
            height: 36,
            decoration: const BoxDecoration(
              color: Color(0xFF0F1C2C),
              shape: BoxShape.circle,
            ),
            child: Center(
              child: Text(
                '$counter',
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 14,
                  fontWeight: FontWeight.w800,
                ),
              ),
            ),
          ),
          const SizedBox(width: 14),

          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Text(
                        segment.title.displayValue,
                        style: const TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w700,
                          color: Color(0xFF191C1E),
                        ),
                      ),
                    ),
                    if (hasDuration) ...[
                      const SizedBox(width: 8),
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 8,
                          vertical: 3,
                        ),
                        decoration: BoxDecoration(
                          color: const Color(0xFFF2F4F6),
                          borderRadius: BorderRadius.circular(6),
                        ),
                        child: Text(
                          segment.durationText,
                          style: const TextStyle(
                            fontSize: 11,
                            fontWeight: FontWeight.w700,
                            color: Color(0xFF7F5700),
                          ),
                        ),
                      ),
                    ],
                  ],
                ),
                if (segment.description.displayValue.trim().isNotEmpty) ...[
                  const SizedBox(height: 6),
                  Text(
                    segment.description.displayValue,
                    style: const TextStyle(
                      fontSize: 13,
                      color: Color(0xFF44474C),
                      height: 1.4,
                    ),
                  ),
                ],
                if (hasDates) ...[
                  const SizedBox(height: 10),
                  Row(
                    children: [
                      const Icon(
                        Icons.event_outlined,
                        size: 15,
                        color: Color(0xFF7F5700),
                      ),
                      const SizedBox(width: 6),
                      Expanded(
                        child: Text(
                          _formatDateRange(
                            segment.startDate!,
                            segment.endDate!,
                          ),
                          style: const TextStyle(
                            fontSize: 12,
                            color: Color(0xFF44474C),
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ],
            ),
          ),
        ],
      ),
    );
  }

  String _formatDateRange(String start, String end) {
    if (start.isNotEmpty && end.isNotEmpty) {
      return "$start - $end";
    }
    return start.isNotEmpty ? start : end;
  }
}
