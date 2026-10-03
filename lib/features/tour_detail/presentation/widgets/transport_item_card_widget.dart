import 'package:flutter/material.dart';
import 'package:rehletna_mobile/features/tour_detail/data/models/transport_model.dart';

class TransportItemCardWidget extends StatelessWidget {
  final TransportModel transport;

  const TransportItemCardWidget({super.key, required this.transport});

  @override
  Widget build(BuildContext context) {
    final bool isPrivate = transport.transportType.toLowerCase().contains(
      'private',
    );

    final originLabel = transport.route?.origin?.label.displayValue ?? '';
    final originCode = transport.route?.origin?.code;
    final originText = (originCode != null && originCode.isNotEmpty)
        ? '$originLabel ($originCode)'
        : originLabel;
    final destinationText =
        transport.route?.destination?.label.displayValue ?? '';
    final bool hasRoute = originText.isNotEmpty || destinationText.isNotEmpty;
    final bool hasProvider = transport.providerName.trim().isNotEmpty;
    final bool hasPricingMode = transport.pricingMode.trim().isNotEmpty;

    String formatTransportType(String raw) {
      if (raw.trim().isEmpty) return '';
      return raw.replaceAll('_', ' ').toUpperCase();
    }

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
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Row(
                  children: [
                    Icon(
                      isPrivate
                          ? Icons.local_taxi_outlined
                          : Icons.directions_bus_outlined,
                      size: 20,
                      color: const Color(0xFF7F5700),
                    ),
                    const SizedBox(width: 8),
                    Expanded(
                      child: Text(
                        transport.displayLabel.displayValue,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w700,
                          color: Color(0xFF191C1E),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              if (transport.transportType.trim().isNotEmpty) ...[
                const SizedBox(width: 8),
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 10,
                    vertical: 4,
                  ),
                  decoration: BoxDecoration(
                    color: isPrivate
                        ? const Color(0xFF0F1C2C)
                        : const Color(0xFFE6E8EA),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Text(
                    formatTransportType(transport.transportType),
                    style: TextStyle(
                      fontSize: 11,
                      fontWeight: FontWeight.w700,
                      color: isPrivate
                          ? const Color(0xFFFDBA45)
                          : const Color(0xFF191C1E),
                    ),
                  ),
                ),
              ],
            ],
          ),

          if (hasRoute) ...[
            const SizedBox(height: 12),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
              decoration: BoxDecoration(
                color: const Color(0xFFF2F4F6),
                borderRadius: BorderRadius.circular(14),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Origin',
                          style: TextStyle(
                            fontSize: 11,
                            color: Color(0xFF74777D),
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        const SizedBox(height: 3),
                        Text(
                          originText.isNotEmpty ? originText : '-',
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(
                            fontSize: 13,
                            fontWeight: FontWeight.w700,
                            color: Color(0xFF191C1E),
                          ),
                        ),
                      ],
                    ),
                  ),

                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                    child: Row(
                      children: [
                        Container(
                          width: 20,
                          height: 1.5,
                          color: const Color(0xFFC4C6CC),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 4),
                          child: Icon(
                            isPrivate
                                ? Icons.directions_car
                                : Icons.directions_bus,
                            size: 18,
                            color: const Color(0xFF7F5700),
                          ),
                        ),
                        Container(
                          width: 20,
                          height: 1.5,
                          color: const Color(0xFFC4C6CC),
                        ),
                      ],
                    ),
                  ),

                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        const Text(
                          'Destination',
                          style: TextStyle(
                            fontSize: 11,
                            color: Color(0xFF74777D),
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        const SizedBox(height: 3),
                        Text(
                          destinationText.isNotEmpty ? destinationText : '-',
                          textAlign: TextAlign.end,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(
                            fontSize: 13,
                            fontWeight: FontWeight.w700,
                            color: Color(0xFF191C1E),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],

          if (hasProvider || hasPricingMode) ...[
            const SizedBox(height: 12),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                if (hasProvider)
                  Expanded(
                    child: Row(
                      children: [
                        const Icon(
                          Icons.business_outlined,
                          size: 16,
                          color: Color(0xFF7F5700),
                        ),
                        const SizedBox(width: 6),
                        Expanded(
                          child: Text(
                            'Provider: ${transport.providerName}',
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: const TextStyle(
                              fontSize: 12,
                              color: Color(0xFF44474C),
                            ),
                          ),
                        ),
                      ],
                    ),
                  )
                else
                  const Spacer(),
                if (hasPricingMode) ...[
                  const SizedBox(width: 8),
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 8,
                      vertical: 2,
                    ),
                    decoration: BoxDecoration(
                      color: const Color(0xFFFFDEAE).withValues(alpha: 0.5),
                      borderRadius: BorderRadius.circular(4),
                    ),
                    child: Text(
                      transport.pricingMode,
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
          ],
        ],
      ),
    );
  }
}
