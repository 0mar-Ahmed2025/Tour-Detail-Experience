import 'package:flutter/material.dart';
import 'package:rehletna_mobile/features/tour_detail/data/models/pricing_model.dart';
import 'package:rehletna_mobile/features/tour_detail/presentation/widgets/pricing_option_card_widget.dart';

class AccommodationPricingSectionWidget extends StatelessWidget {
  final PackagePricingModel pricingModel;
  final String selectedCode;
  final num basePrice;
  final String currency;
  final ValueChanged<String>? onOptionSelected;

  const AccommodationPricingSectionWidget({
    super.key,
    required this.pricingModel,
    required this.selectedCode,
    required this.basePrice,
    required this.currency,
    this.onOptionSelected,
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

    final bool hasNote = pricingModel.note.displayValue.trim().isNotEmpty;

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
        if (hasNote) ...[const SizedBox(height: 12), _buildInfoNote()],
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
    final bool isPrimarySelected = selectedCode == primary.code;

    return GestureDetector(
      onTap: () => onOptionSelected?.call(primary.code),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: isPrimarySelected ? _infoBackgroundColor : Colors.white,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(
            color: isPrimarySelected ? _primaryColor : Colors.transparent,
            width: 1.5,
          ),
          boxShadow: [
            BoxShadow(
              color: const Color(0xFF0F1C2C).withValues(alpha: 0.05),
              blurRadius: 20,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildSelectionIndicator(isPrimarySelected),
            const SizedBox(width: 12),
            Expanded(child: _buildPrimaryDetails(primary)),
            const SizedBox(width: 12),
            _buildPrimaryPrice(primary),
          ],
        ),
      ),
    );
  }

  Widget _buildSelectionIndicator(bool isSelected) {
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
    final String note = primary.note.displayValue.trim();

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
    return ListView.separated(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: pricingModel.options.length,
      separatorBuilder: (context, index) => const SizedBox(height: 12),
      itemBuilder: (context, index) {
        final option = pricingModel.options[index];
        return PricingOptionCardWidget(
          option: option,
          pricingCurrency: pricingModel.currency,
          isSelected: selectedCode == option.code,
          onSelected: onOptionSelected,
        );
      },
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
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.only(top: 2),
            child: Icon(Icons.info_outline, size: 18, color: _primaryColor),
          ),
          const SizedBox(width: 8),
          Expanded(
            child: Text(
              pricingModel.note.displayValue,
              style: const TextStyle(
                fontSize: 12,
                color: _infoTextColor,
                fontWeight: FontWeight.w500,
                height: 1.4,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
