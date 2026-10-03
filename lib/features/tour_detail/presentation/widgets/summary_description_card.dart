import 'package:flutter/material.dart';

class SummaryDescriptionCard extends StatefulWidget {
  final String packageSummary;
  final String description;
  final String suitabilityText;

  const SummaryDescriptionCard({
    super.key,
    required this.packageSummary,
    required this.description,
    required this.suitabilityText,
  });

  @override
  State<SummaryDescriptionCard> createState() => _SummaryDescriptionCardState();
}

class _SummaryDescriptionCardState extends State<SummaryDescriptionCard> {
  bool _isExpanded = false;

  @override
  Widget build(BuildContext context) {
    final bool hasSummary = widget.packageSummary.trim().isNotEmpty;
    final bool hasSuitability = widget.suitabilityText.trim().isNotEmpty;
    final bool hasDescription = widget.description.trim().isNotEmpty;

    return Container(
      padding: const EdgeInsets.all(18),
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
          // 1. Header
          const Row(
            children: [
              Icon(Icons.info_outline, size: 20, color: Color(0xFF7F5700)),
              SizedBox(width: 8),
              Text(
                'Summary & Description', // 'summary_and_description'.tr()
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w700,
                  color: Color(0xFF191C1E),
                ),
              ),
            ],
          ),

          if (hasSummary) ...[
            const SizedBox(height: 14),
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(14),
              decoration: BoxDecoration(
                color: const Color(0xFFF2F4F6),
                borderRadius: BorderRadius.circular(14),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Package Summary:',
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w800,
                      color: Color(0xFF7F5700),
                    ),
                  ),
                  const SizedBox(height: 6),
                  Text(
                    widget.packageSummary,
                    style: const TextStyle(
                      fontSize: 14,
                      height: 1.45,
                      fontWeight: FontWeight.w500,
                      color: Color(0xFF191C1E),
                    ),
                  ),
                ],
              ),
            ),
          ],

          if (hasDescription) ...[
            const SizedBox(height: 14),
            const Text(
              'Description:',
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w800,
                color: Color(0xFF7F5700),
              ),
            ),
            const SizedBox(height: 6),
            Text(
              widget.description,
              maxLines: _isExpanded ? null : 4,
              overflow: _isExpanded
                  ? TextOverflow.visible
                  : TextOverflow.ellipsis,
              style: const TextStyle(
                fontSize: 14,
                height: 1.45,
                fontWeight: FontWeight.w400,
                color: Color(0xFF44474C),
              ),
            ),
            if (widget.description.length > 160) ...[
              const SizedBox(height: 4),
              GestureDetector(
                onTap: () {
                  setState(() {
                    _isExpanded = !_isExpanded;
                  });
                },
                child: Text(
                  _isExpanded ? 'Show Less' : 'Read More',
                  style: const TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.w700,
                    color: Color(0xFF7F5700),
                  ),
                ),
              ),
            ],
          ],

          if (hasSuitability) ...[
            const SizedBox(height: 16),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
              decoration: BoxDecoration(
                color: const Color(0xFFFFF8ED),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Row(
                children: [
                  const Icon(
                    Icons.sentiment_satisfied_alt_outlined,
                    size: 18,
                    color: Color(0xFF7F5700),
                  ),
                  const SizedBox(width: 8),
                  Expanded(
                    child: Text(
                      widget.suitabilityText,
                      style: const TextStyle(
                        fontSize: 13,
                        color: Color(0xFF6F4B00),
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ],
      ),
    );
  }
}
