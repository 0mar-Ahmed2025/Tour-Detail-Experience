import 'package:flutter/material.dart';
import 'package:rehletna_mobile/features/tour_detail/data/models/service_model.dart';

class IncludedServiceCardWidget extends StatelessWidget {
  final ServiceModel service;

  const IncludedServiceCardWidget({super.key, required this.service});

  @override
  Widget build(BuildContext context) {
    final bool hasDescription = service.description.displayValue
        .trim()
        .isNotEmpty;

    final String priceStr = (service.priceAmount ?? '').trim();
    final String currencyStr = (service.priceCurrency ?? '').trim();
    final bool hasPrice =
        priceStr.isNotEmpty && priceStr != '0' && priceStr != '0.0';
    final bool hasInclusionMode = service.inclusionMode.trim().isNotEmpty;

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
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Padding(
                padding: EdgeInsets.only(top: 2),
                child: Icon(
                  Icons.verified_user_outlined,
                  size: 20,
                  color: Color(0xFF7F5700),
                ),
              ),
              const SizedBox(width: 8),

              Expanded(
                child: Text(
                  service.name.displayValue,
                  style: const TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w700,
                    color: Color(0xFF191C1E),
                    height: 1.3,
                  ),
                ),
              ),

              if (hasPrice || hasInclusionMode) ...[
                const SizedBox(width: 12),
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 10,
                    vertical: 4,
                  ),
                  decoration: BoxDecoration(
                    color: const Color(0xFFF2F4F6),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      if (hasPrice)
                        Text(
                          "$priceStr $currencyStr",
                          style: const TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w800,
                            color: Color(0xFF7F5700),
                          ),
                        ),
                      if (hasInclusionMode)
                        Text(
                          "(${service.inclusionMode})",
                          style: TextStyle(
                            fontSize: 10,
                            fontWeight: FontWeight.w600,
                            color: hasPrice
                                ? const Color(0xFF74777D)
                                : const Color(0xFF7F5700),
                          ),
                        ),
                    ],
                  ),
                ),
              ],
            ],
          ),

          if (hasDescription) ...[
            const SizedBox(height: 8),
            Text(
              service.description.displayValue,
              style: const TextStyle(
                fontSize: 13,
                color: Color(0xFF44474C),
                height: 1.4,
              ),
            ),
          ],
        ],
      ),
    );
  }
}
