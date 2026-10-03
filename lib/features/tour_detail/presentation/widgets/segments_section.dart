import 'package:flutter/material.dart';
import 'package:rehletna_mobile/features/tour_detail/data/models/segment_model.dart';
import 'package:rehletna_mobile/features/tour_detail/presentation/widgets/segment_item_card_widget.dart';

class SegmentsSection extends StatelessWidget {
  final List<SegmentModel> segments;

  const SegmentsSection({super.key, required this.segments});

  @override
  Widget build(BuildContext context) {
    if (segments.isEmpty) {
      return const SizedBox.shrink();
    }

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
                  'Tour Segments', //  'tour_segments'.tr()
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
                color: const Color(0xFFFFF8ED),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Text(
                '${segments.length} Steps',
                style: const TextStyle(
                  fontSize: 11,
                  fontWeight: FontWeight.w700,
                  color: Color(0xFF7F5700),
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 16),

        ListView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: segments.length,
          itemBuilder: (context, index) {
            final isLast = index == segments.length - 1;

            return Column(
              children: [
                SegmentItemCardWidget(
                  segment: segments[index],
                  counter: index + 1,
                ),
                if (!isLast)
                  Container(
                    margin: const EdgeInsets.only(left: 33),
                    alignment: Alignment.centerLeft,
                    height: 16,
                    child: Container(
                      width: 2,
                      height: 16,
                      color: const Color(0xFFD0D5DD),
                    ),
                  ),
              ],
            );
          },
        ),
      ],
    );
  }
}
