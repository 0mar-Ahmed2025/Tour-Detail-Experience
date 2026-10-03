import 'localized_text_model.dart';
import 'segment_model.dart';

class ServiceModel {
  final String scope;
  final String referenceType;
  final String type;
  final LocalizedTextModel name;
  final LocalizedTextModel description;
  final String inclusionMode;
  final String? priceAmount;
  final String? priceCurrency;
  final String? priceUnit;
  final String? quantity;
  final SegmentReferenceModel? segment;
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
    this.priceUnit,
    this.quantity,
    this.segment,
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
      priceAmount: json['pricing']?['amount']?.toString(),
      priceCurrency: json['pricing']?['currency'] as String?,
      priceUnit: json['pricing']?['unit'] as String?,
      quantity: json['quantity']?.toString(),
      segment: json['segment'] is Map<String, dynamic>
          ? SegmentReferenceModel.fromJson(json['segment'])
          : null,
      sortOrder: json['sort_order'] as int? ?? 0,
    );
  }
}
