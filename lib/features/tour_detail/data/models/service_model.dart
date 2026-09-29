import 'localized_text_model.dart';

class ServiceModel {
  final String scope; // 'package' or 'segment'
  final String referenceType;
  final String type;
  final LocalizedTextModel name;
  final LocalizedTextModel description;
  final String inclusionMode;
  final String priceAmount;
  final String priceCurrency;
  final int sortOrder;

  const ServiceModel({
    required this.scope,
    required this.referenceType,
    required this.type,
    required this.name,
    required this.description,
    required this.inclusionMode,
    required this.priceAmount,
    required this.priceCurrency,
    required this.sortOrder,
  });

  factory ServiceModel.fromJson(Map<String, dynamic> json) {
    return ServiceModel(
      scope: json['scope'] as String? ?? 'package',
      referenceType: json['reference_type'] as String? ?? '',
      type: json['type'] as String? ?? '',
      name: LocalizedTextModel.fromJson(json['name']),
      description: LocalizedTextModel.fromJson(json['description']),
      inclusionMode: json['inclusion_mode'] as String? ?? 'included',
      priceAmount: json['pricing']?['amount'] as String? ?? '0.00',
      priceCurrency: json['pricing']?['currency'] as String? ?? '',
      sortOrder: json['sort_order'] as int? ?? 0,
    );
  }
}
