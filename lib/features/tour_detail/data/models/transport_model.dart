import 'localized_text_model.dart';
import 'segment_model.dart';

class TransportModel {
  final String transportReferenceType;
  final String assignmentScope; // 'package' or 'segment'
  final String direction;
  final String transportType;
  final String? transferType;
  final String? vehicleType;
  final String providerName;
  final String? providerCode;
  final String? serviceNumber;
  final RouteModel? route;
  final LocalizedTextModel displayLabel;
  final bool isPrimary;
  final bool isRequired;
  final String pricingMode;
  final int sortOrder;
  final SegmentReferenceModel? segment;
  final String? departureAt;
  final String? arrivalAt;
  final String? departureTimezone;
  final String? arrivalTimezone;
  final int? durationMinutes;
  final String? serviceClass;
  final LocalizedTextModel baggageSummary;

  const TransportModel({
    required this.transportReferenceType,
    required this.assignmentScope,
    required this.direction,
    required this.transportType,
    this.transferType,
    this.vehicleType,
    required this.providerName,
    this.providerCode,
    this.serviceNumber,
    this.route,
    required this.displayLabel,
    required this.isPrimary,
    required this.isRequired,
    required this.pricingMode,
    required this.sortOrder,
    this.segment,
    this.departureAt,
    this.arrivalAt,
    this.departureTimezone,
    this.arrivalTimezone,
    this.durationMinutes,
    this.serviceClass,
    required this.baggageSummary,
  });

  factory TransportModel.fromJson(Map<String, dynamic> json) {
    final transport = json['transport'] is Map<String, dynamic>
        ? json['transport'] as Map<String, dynamic>
        : const <String, dynamic>{};
    return TransportModel(
      transportReferenceType: json['transport_reference_type'] as String? ?? '',
      assignmentScope: json['assignment_scope'] as String? ?? 'package',
      direction: json['direction'] as String? ?? '',
      transportType:
          json['transport_type'] as String? ??
          transport['transport_type'] as String? ??
          '',
      transferType: json['transfer_type'] as String?,
      vehicleType: json['vehicle_type'] as String?,
      providerName:
          json['provider_name'] as String? ??
          transport['provider_name'] as String? ??
          '',
      providerCode:
          json['provider_code'] as String? ??
          transport['provider_code'] as String?,
      serviceNumber:
          json['service_number'] as String? ??
          transport['service_number'] as String?,
      route: json['route'] != null ? RouteModel.fromJson(json['route']) : null,
      displayLabel: LocalizedTextModel.fromJson(json['display_label']),
      isPrimary: json['is_primary'] as bool? ?? false,
      isRequired: json['is_required'] as bool? ?? false,
      pricingMode: json['pricing_mode'] as String? ?? 'included',
      sortOrder: json['sort_order'] as int? ?? 0,
      segment: json['segment'] is Map<String, dynamic>
          ? SegmentReferenceModel.fromJson(json['segment'])
          : null,
      departureAt: json['departure_at'] as String?,
      arrivalAt: json['arrival_at'] as String?,
      departureTimezone: json['departure_timezone'] as String?,
      arrivalTimezone: json['arrival_timezone'] as String?,
      durationMinutes: json['duration_minutes'] as int?,
      serviceClass: json['service_class'] as String?,
      baggageSummary: LocalizedTextModel.fromJson(json['baggage_summary']),
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
