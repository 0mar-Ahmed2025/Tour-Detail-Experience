import 'localized_text_model.dart';

class PackagePricingModel {
  final String pricingModel;
  final String currency;
  final bool requiresQuote;
  final String displayMode;
  final String? amountFrom;
  final PriceOptionModel? primary;
  final List<PriceOptionModel> options;
  final LocalizedTextModel note;

  const PackagePricingModel({
    required this.pricingModel,
    required this.currency,
    required this.requiresQuote,
    required this.displayMode,
    this.amountFrom,
    this.primary,
    required this.options,
    required this.note,
  });

  factory PackagePricingModel.fromJson(Map<String, dynamic> json) {
    return PackagePricingModel(
      pricingModel: json['pricing_model'] as String? ?? '',
      currency: json['currency'] as String? ?? '',
      requiresQuote: json['requires_quote'] as bool? ?? false,
      displayMode: json['display_mode'] as String? ?? '',
      amountFrom: json['amount_from']?.toString(),
      primary: json['primary'] != null
          ? PriceOptionModel.fromJson(json['primary'])
          : null,
      options: (json['options'] as List? ?? [])
          .map((item) => PriceOptionModel.fromJson(item))
          .toList(),
      note: LocalizedTextModel.fromJson(json['note']),
    );
  }
}

class PriceOptionModel {
  final String code;
  final String pricingBasis;
  final String amount;
  final LocalizedTextModel label;
  final LocalizedTextModel note;

  const PriceOptionModel({
    required this.code,
    required this.pricingBasis,
    required this.amount,
    required this.label,
    required this.note,
  });

  factory PriceOptionModel.fromJson(Map<String, dynamic> json) {
    return PriceOptionModel(
      code: json['code'] as String? ?? '',
      pricingBasis: json['pricing_basis'] as String? ?? '',
      amount: json['amount']?.toString() ?? '',
      label: LocalizedTextModel.fromJson(json['label']),
      note: LocalizedTextModel.fromJson(json['note']),
    );
  }
}
