import 'package:rehletna_mobile/features/tour_detail/data/models/segment_model.dart';
import 'package:rehletna_mobile/features/tour_detail/data/models/service_model.dart';
import 'package:rehletna_mobile/features/tour_detail/data/models/transport_model.dart';
import '../../../../core/constants/api_constants.dart';
import '../../data/models/localized_text_model.dart';
import '../../data/models/tour_package_model.dart';

extension LocalizedTextX on LocalizedTextModel {
  String get displayValue {
    if (en != null && en!.isNotEmpty) return en!;
    if (ar != null && ar!.isNotEmpty) return ar!;
    if (fa != null && fa!.isNotEmpty) return fa!;
    return '';
  }
}

extension SegmentX on SegmentModel {
  String get durationText {
    if (fixedDays == null && fixedNights == null) return 'Duration N/A';
    final days = fixedDays != null ? '$fixedDays Days' : '';
    final nights = fixedNights != null ? '$fixedNights Nights' : '';
    if (days.isNotEmpty && nights.isNotEmpty) return '$days / $nights';
    return days.isNotEmpty ? days : nights;
  }
}

extension TourPackageX on TourPackageModel {
  String? get coverImageUrl {
    final rawUrl = coverMedia?.url;
    if (rawUrl == null || rawUrl.trim().isEmpty) return null;

    if (rawUrl.startsWith('http://') || rawUrl.startsWith('https://')) {
      return rawUrl;
    }

    final baseUrl = ApiConstants.baseUrl.endsWith('/')
        ? ApiConstants.baseUrl.substring(0, ApiConstants.baseUrl.length - 1)
        : ApiConstants.baseUrl;

    final path = rawUrl.startsWith('/') ? rawUrl : '/$rawUrl';

    return '$baseUrl$path';
  }

  String get formattedBasePrice {
    return '$currency $basePriceFrom';
  }

  String get durationText {
    if (fixedDays == null && fixedNights == null) return 'Duration N/A';
    final days = fixedDays != null ? '$fixedDays Days' : '';
    final nights = fixedNights != null ? '$fixedNights Nights' : '';
    if (days.isNotEmpty && nights.isNotEmpty) return '$days / $nights';
    return days.isNotEmpty ? days : nights;
  }

  List<SegmentModel> get sortedSegments {
    final list = List<SegmentModel>.from(segments);
    list.sort((a, b) => a.sortOrder.compareTo(b.sortOrder));
    return list;
  }

  List<TransportModel> get sortedTransports {
    final list = List<TransportModel>.from(transports);
    list.sort((a, b) => a.sortOrder.compareTo(b.sortOrder));
    return list;
  }

  List<ServiceModel> get sortedServices {
    final list = List<ServiceModel>.from(services);
    list.sort((a, b) => a.sortOrder.compareTo(b.sortOrder));
    return list;
  }
}


extension PackageScopedComponentsX on TourPackageModel {
  List<TransportModel> get globalTransports {
    return transports.where((t) => t.assignmentScope == 'package' || t.segment == null).toList()
      ..sort((a, b) => a.sortOrder.compareTo(b.sortOrder));
  }
  List<ServiceModel> get globalServices {
    return services.where((s) => s.scope == 'package' || s.segment == null).toList()
      ..sort((a, b) => a.sortOrder.compareTo(b.sortOrder));
  }
}

extension SegmentComponentsX on SegmentModel {
  List<TransportModel> getTransports(List<TransportModel> allTransports) {
    return allTransports.where((t) {
      final isSegmentScope = t.assignmentScope == 'segment';
      final matchesId = t.segment?.id != null && t.segment!.id == id;
      final matchesUuid = t.segment?.uuid != null && t.segment!.uuid == uuid;
      return isSegmentScope && (matchesId || matchesUuid);
    }).toList()
      ..sort((a, b) => a.sortOrder.compareTo(b.sortOrder));
  }

  List<ServiceModel> getServices(List<ServiceModel> allServices) {
    return allServices.where((s) {
      final isSegmentScope = s.scope == 'segment';
      final matchesId = s.segment?.id != null && s.segment!.id == id;
      final matchesUuid = s.segment?.uuid != null && s.segment!.uuid == uuid;
      return isSegmentScope && (matchesId || matchesUuid);
    }).toList()
      ..sort((a, b) => a.sortOrder.compareTo(b.sortOrder));
  }
}