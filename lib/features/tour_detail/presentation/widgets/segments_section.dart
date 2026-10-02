

import 'package:flutter/material.dart';
import 'package:rehletna_mobile/features/tour_detail/data/models/segment_model.dart';
import 'package:rehletna_mobile/features/tour_detail/presentation/widgets/segment_item_card_widget.dart';

class SegmentsSection extends StatelessWidget {
  final List<SegmentModel> segments;

  const SegmentsSection({super.key, required this.segments});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                const Icon(Icons.alt_route, size: 22, color: Color(0xFF7F5700)),
                const SizedBox(width: 8),
                Text(
                  'Segments (${segments.length})',
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w700,
                    color: Color(0xFF191C1E),
                  ),
                ),
              ],
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
              decoration: BoxDecoration(
                color: const Color(0xFFFFDEAE).withValues(alpha: 0.5),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Text(
                '${segments.length} Segments',
                style: const TextStyle(
                  fontSize: 11,
                  fontWeight: FontWeight.w700,
                  color: Color(0xFF7F5700),
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 14),
        Stack(
          children: [
            Positioned(
              left: 34,
              top: 32,
              bottom: 32,
              child: Container(width: 2, color: const Color(0xFFE6E8EA)),
            ),
            Column(
              children: [
                for (int i = 0; i < segments.length; i++) ...[
                  SegmentItemCardWidget(segment: segments[i], counter: i + 1),
                  if (i < segments.length - 1) const SizedBox(height: 12),
                ],
              ],
            ),
          ],
        ),
      ],
    );
  }
}
