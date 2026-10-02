import 'package:flutter/material.dart';

class BottomBookingBarWidget extends StatelessWidget {
  final String startingPrice;
  final String? startingPriceIrt;
  final String? currency;
  final String? packageCurrency;

  final VoidCallback? onRequestToBook;

  const BottomBookingBarWidget({
    super.key,
    required this.startingPrice,
    this.startingPriceIrt,
    this.onRequestToBook,
    this.currency,
    this.packageCurrency,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: const Color(0xFFF7F9FB).withValues(alpha: 0.96),
        boxShadow: [
          BoxShadow(
            color: const Color(0xFF0F1C2C).withValues(alpha: 0.08),
            blurRadius: 20,
            offset: const Offset(0, -4),
          ),
        ],
        border: const Border(
          top: BorderSide(color: Color(0xFFECEEF0), width: 1.0),
        ),
      ),
      child: SafeArea(
        top: false,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 12.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Starting from',
                    style: TextStyle(
                      fontSize: 11,
                      fontWeight: FontWeight.w600,
                      color: Color(0xFF74777D),
                    ),
                  ),
                  const SizedBox(height: 2),
                  Text(
                    "$startingPrice $currency",
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w800,
                      color: Color(0xFF191C1E),
                    ),
                  ),
                  if (startingPriceIrt != null && packageCurrency != null) ...[
                    const SizedBox(height: 1),
                    Text(
                      "$startingPriceIrt $packageCurrency",
                      style: const TextStyle(
                        fontFamily: 'monospace',
                        fontSize: 11,
                        color: Color(0xFF74777D),
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ],
              ),
              ElevatedButton(
                onPressed: onRequestToBook,
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF0F1C2C),
                  foregroundColor: Colors.white,
                  elevation: 4,
                  shadowColor: const Color(0xFF0F1C2C).withValues(alpha: 0.3),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                  padding: const EdgeInsets.symmetric(
                    horizontal: 24,
                    vertical: 14,
                  ),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: const [
                    Text(
                      'Request to Book',
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    SizedBox(width: 8),
                    Icon(Icons.arrow_forward, size: 18),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
