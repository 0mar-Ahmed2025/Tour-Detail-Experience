import 'package:flutter/material.dart';
import 'package:rehletna_mobile/features/tour_detail/data/models/pricing_model.dart';
import 'package:rehletna_mobile/features/tour_detail/presentation/widgets/pricing_option_card_widget.dart';

class AccommodationPricingSectionWidget extends StatelessWidget {
  final PackagePricingModel pricingModel;
  final String selectedCode;
  final bool isSelected;
  final num basePrice;
  final String currency;

  const AccommodationPricingSectionWidget({
    super.key,
    required this.pricingModel,
    required this.selectedCode,
    required this.isSelected,
    required this.basePrice,
    required this.currency,
  });

  static const _primaryColor = Color(0xFF7F5700);
  static const _textColor = Color(0xFF191C1E);
  static const _darkColor = Color(0xFF0F1C2C);
  static const _lightColor = Color(0xFFE6E8EA);
  static const _infoBackgroundColor = Color(0xFFF2F4F6);
  static const _infoTextColor = Color(0xFF44474C);
  static const _accentColor = Color(0xFFFDBA45);

  @override
  Widget build(BuildContext context) {
    final primary = pricingModel.primary;

    if (primary == null) {
      return const SizedBox.shrink();
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildHeader(),
        const SizedBox(height: 14),
        _buildPrimaryPricingCard(primary),
        if (pricingModel.options.isNotEmpty) ...[
          const SizedBox(height: 12),
          _buildPricingOptions(),
        ],
        const SizedBox(height: 12),
        _buildInfoNote(),
      ],
    );
  }

  Widget _buildHeader() {
    return const Row(
      children: [
        Icon(Icons.bed_outlined, size: 22, color: _primaryColor),
        SizedBox(width: 8),
        Text(
          'Accommodation & Pricing',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w700,
            color: _textColor,
          ),
        ),
      ],
    );
  }

  Widget _buildPrimaryPricingCard(dynamic primary) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          color: isSelected ? _primaryColor : Colors.transparent,
        ),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildSelectionIndicator(),
          const SizedBox(width: 18),
          Expanded(child: _buildPrimaryDetails(primary)),
          const SizedBox(width: 12),
          _buildPrimaryPrice(primary),
        ],
      ),
    );
  }

  Widget _buildSelectionIndicator() {
    return Container(
      width: 24,
      height: 24,
      margin: const EdgeInsets.only(top: 2),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: isSelected ? _darkColor : _lightColor,
      ),
      child: isSelected
          ? const Icon(Icons.check, size: 16, color: _accentColor)
          : null,
    );
  }

  Widget _buildPrimaryDetails(dynamic primary) {
    final note = primary.note.displayValue;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          primary.label.displayValue,
          style: const TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.w700,
            color: _textColor,
          ),
        ),
        if (note.isNotEmpty) ...[
          const SizedBox(height: 3),
          Text(
            note,
            style: const TextStyle(
              fontSize: 12,
              color: _primaryColor,
              height: 1.3,
            ),
          ),
        ],
        const SizedBox(height: 4),
        Text(
          'Code: ${primary.code}',
          style: const TextStyle(
            fontFamily: 'monospace',
            fontSize: 11,
            color: _primaryColor,
            fontWeight: FontWeight.w600,
          ),
        ),
      ],
    );
  }

  Widget _buildPrimaryPrice(dynamic primary) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Text(
          '${primary.amount} ${pricingModel.currency}',
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w800,
            color: _textColor,
          ),
        ),
        Text(
          "$basePrice $currency",
          style: const TextStyle(
            fontSize: 11,
            fontFamily: 'monospace',
            fontWeight: FontWeight.w600,
            color: _infoTextColor,
            letterSpacing: 1,
          ),
        ),
      ],
    );
  }

  Widget _buildPricingOptions() {
    return Column(
      children: pricingModel.options
          .map(
            (option) => Padding(
              padding: const EdgeInsets.only(bottom: 12),
              child: PricingOptionCardWidget(
                option: option,
                pricingCurrency: pricingModel.currency,
                isSelected: false,
                onSelected: (_) {},
              ),
            ),
          )
          .toList(),
    );
  }

  Widget _buildInfoNote() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
      decoration: BoxDecoration(
        color: _infoBackgroundColor,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          Icon(Icons.info_outline, size: 18, color: _primaryColor),
          SizedBox(width: 8),
          Expanded(
            child: Text(
              pricingModel.note.displayValue,
              style: TextStyle(
                fontSize: 12,
                color: _infoTextColor,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
