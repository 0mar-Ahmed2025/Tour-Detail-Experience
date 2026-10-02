


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
              Row(
                children: [
                  Icon(
                    isPrivate
                        ? Icons.local_taxi_outlined
                        : Icons.directions_bus_outlined,
                    size: 20,
                    color: const Color(0xFF7F5700),
                  ),
                  const SizedBox(width: 8),
                  Text(
                    transport.displayLabel.displayValue,
                    style: const TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w700,
                      color: Color(0xFF191C1E),
                    ),
                  ),
                ],
              ),
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
                  transport.transportType.toUpperCase(),
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
          ),
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
                        "${transport.route!.origin!.label.displayValue} (${transport.route!.origin!.code!})",

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
                      Text(
                        "",
                        style: const TextStyle(
                          fontSize: 13,
                          fontWeight: FontWeight.w700,
                          color: Color(0xFF191C1E),
                        ),
                      ),
                      Container(
                        width: 24,
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
                        width: 24,
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
                        transport.route!.destination!.label.displayValue,
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
          const SizedBox(height: 12),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  const Icon(
                    Icons.business_outlined,
                    size: 16,
                    color: Color(0xFF7F5700),
                  ),
                  const SizedBox(width: 6),
                  Text(
                    'Provider: ${transport.providerName}',
                    style: const TextStyle(
                      fontSize: 12,
                      color: Color(0xFF44474C),
                    ),
                  ),
                ],
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
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
          ),
        ],
      ),
    );
  }
}
