import 'package:flutter/material.dart';
import 'package:rehletna_mobile/features/tour_detail/data/models/transport_model.dart';
import 'package:rehletna_mobile/features/tour_detail/presentation/widgets/transport_item_card_widget.dart';

class TransportsSection extends StatelessWidget {
  final List<TransportModel> transports;

  const TransportsSection({super.key, required this.transports});

  @override
  Widget build(BuildContext context) {
    if (transports.isEmpty) {
      return const SizedBox.shrink();
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: const [
                Icon(
                  Icons.directions_bus_filled_outlined,
                  size: 22,
                  color: Color(0xFF7F5700),
                ),
                SizedBox(width: 8),
                Text(
                  'Transports',
                  style: TextStyle(
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
                '${transports.length} Options',
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

        ListView.separated(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: transports.length,
          separatorBuilder: (context, index) => const SizedBox(height: 12),
          itemBuilder: (context, index) {
            return TransportItemCardWidget(transport: transports[index]);
          },
        ),
      ],
    );
  }
}
