

import 'package:flutter/material.dart';
import 'package:rehletna_mobile/features/tour_detail/data/models/transport_model.dart';
import 'package:rehletna_mobile/features/tour_detail/presentation/widgets/transport_item_card_widget.dart';

class TransportsSection extends StatelessWidget {
  final List<TransportModel> transports;

  const TransportsSection({super.key, required this.transports});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
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
        const SizedBox(height: 14),
        Column(
          children: [
            for (int i = 0; i < transports.length; i++) ...[
              TransportItemCardWidget(transport: transports[i]),
              if (i < transports.length - 1) const SizedBox(height: 12),
            ],
          ],
        ),
      ],
    );
  }
}
