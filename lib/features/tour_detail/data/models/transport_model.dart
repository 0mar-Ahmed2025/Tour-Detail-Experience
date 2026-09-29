import 'localized_text_model.dart';

class TransportModel {
  final String transportReferenceType;
  final String assignmentScope; // 'package' or 'segment'
  final String direction;
  final String transportType;
  final String providerName;
  final RouteModel? route;
  final LocalizedTextModel displayLabel;
  final bool isPrimary;
  final bool isRequired;
  final String pricingMode;
  final int sortOrder;

  const TransportModel({
    required this.transportReferenceType,
    required this.assignmentScope,
    required this.direction,
    required this.transportType,
    required this.providerName,
    this.route,
    required this.displayLabel,
    required this.isPrimary,
    required this.isRequired,
    required this.pricingMode,
    required this.sortOrder,
  });

  factory TransportModel.fromJson(Map<String, dynamic> json) {
    return TransportModel(
      transportReferenceType: json['transport_reference_type'] as String? ?? '',
      assignmentScope: json['assignment_scope'] as String? ?? 'package',
      direction: json['direction'] as String? ?? '',
      transportType: json['transport_type'] as String? ?? '',
      providerName: json['provider_name'] as String? ?? '',
      route: json['route'] != null ? RouteModel.fromJson(json['route']) : null,
      displayLabel: LocalizedTextModel.fromJson(json['display_label']),
      isPrimary: json['is_primary'] as bool? ?? false,
      isRequired: json['is_required'] as bool? ?? false,
      pricingMode: json['pricing_mode'] as String? ?? 'included',
      sortOrder: json['sort_order'] as int? ?? 0,
    );
  }
}

class RouteModel {
  final LocationPointModel? origin;
  final LocationPointModel? destination;

  const RouteModel({this.origin, this.destination});

  factory RouteModel.fromJson(Map<String, dynamic> json) {
    return RouteModel(
      origin: json['origin'] != null
          ? LocationPointModel.fromJson(json['origin'])
          : null,
      destination: json['destination'] != null
          ? LocationPointModel.fromJson(json['destination'])
          : null,
    );
  }
}

class LocationPointModel {
  final String? code;
  final LocalizedTextModel label;

  const LocationPointModel({this.code, required this.label});

  factory LocationPointModel.fromJson(Map<String, dynamic> json) {
    return LocationPointModel(
      code: json['code'] as String?,
      label: LocalizedTextModel.fromJson(json['label']),
    );
  }
}
