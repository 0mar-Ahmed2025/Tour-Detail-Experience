import 'package:flutter/material.dart';
import 'package:rehletna_mobile/features/tour_detail/data/models/pricing_model.dart';


class PricingOptionCardWidget extends StatelessWidget {
  final PriceOptionModel option;
  final bool isSelected;
  final ValueChanged<String>? onSelected;
  final String? pricingCurrency;

  const PricingOptionCardWidget({
    super.key,
    required this.option,
    required this.isSelected,
    this.onSelected,
    this.pricingCurrency,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onSelected?.call(option.code),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: isSelected ? const Color(0xFFF2F4F6) : Colors.white,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(
            color: isSelected ? const Color(0xFF7F5700) : Colors.transparent,
            width: 1.5,
          ),
          boxShadow: [
            BoxShadow(
              color: const Color(0xFF0F1C2C).withValues(alpha: 0.06),
              blurRadius: 20,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: 24,
              height: 24,
              margin: const EdgeInsets.only(top: 2),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: isSelected
                    ? const Color(0xFF0F1C2C)
                    : const Color(0xFFE6E8EA),
              ),
              child: isSelected
                  ? const Icon(Icons.check, size: 16, color: Color(0xFFFDBA45))
                  : null,
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    option.label.displayValue,
                    style: const TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w700,
                      color: Color(0xFF191C1E),
                    ),
                  ),
                  if (option.note.displayValue.isNotEmpty) ...[
                    const SizedBox(height: 3),
                    Text(
                      option.note.displayValue,
                      style: const TextStyle(
                        fontSize: 12,
                        color: Color(0xFF7F5700),
                        height: 1.3,
                      ),
                    ),
                  ],
                  const SizedBox(height: 4),
                  Text(
                    'Code: ${option.code}',
                    style: const TextStyle(
                      fontFamily: 'monospace',
                      fontSize: 11,
                      color: Color(0xFF7F5700),
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  "${option.amount} ${pricingCurrency ?? ""}",
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w800,
                    color: Color(0xFF191C1E),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
