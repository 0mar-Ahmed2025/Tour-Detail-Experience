import 'package:rehletna_mobile/features/tour_detail/data/models/tag_model.dart';

import 'cover_media_model.dart';
import 'destination_model.dart';
import 'localized_text_model.dart';
import 'pricing_model.dart';
import 'segment_model.dart';
import 'service_model.dart';
import 'transport_model.dart';

class TourPackageResponseModel {
  final bool ok;
  final TourPackageModel? item;

  const TourPackageResponseModel({required this.ok, this.item});

  factory TourPackageResponseModel.fromJson(Map<String, dynamic> json) {
    return TourPackageResponseModel(
      ok: json['ok'] as bool? ?? false,
      item: json['data']?['item'] != null
          ? TourPackageModel.fromJson(json['data']['item'])
          : null,
    );
  }
}

class TourDepartureModel {
  final int? id;
  final String? uuid;
  final String? departureDate;

  const TourDepartureModel({this.id, this.uuid, this.departureDate});

  factory TourDepartureModel.fromJson(Map<String, dynamic> json) {
    return TourDepartureModel(
      id: json['id'] as int?,
      uuid: json['uuid'] as String?,
      departureDate: json['departure_date'] as String?,
    );
  }
}

class TourPackageModel {
  final int id;
  final String uuid;
  final String slug;
  final LocalizedTextModel title;
  final LocalizedTextModel summary;
  final LocalizedTextModel description;
  final String bookingModel;
  final String dateModel;
  final String durationModel;
  final String journeyModel;
  final String operationModel;
  final String guidanceModel;
  final String transportPolicy;
  final String servicePolicy;
  final String? defaultStartDate;
  final String? defaultEndDate;
  final int? fixedDays;
  final int? fixedNights;
  final String currency;
  final num basePriceFrom;
  final String primaryCountry;
  final String primaryCity;
  final String destinationLabel;
  final CoverMediaModel? coverMedia;
  final List<CoverMediaModel> gallery;
  final List<TourAttachmentModel> attachments;
  final List<TourDepartureModel> departures;
  final List<DestinationModel> destinations;
  final List<SegmentModel> segments;
  final List<TransportModel> transports;
  final List<ServiceModel> services;
  final List<TagModel> tags;
  final List<String> themes;

  final PackagePricingModel? pricing;

  const TourPackageModel({
    required this.id,
    required this.uuid,
    required this.slug,
    required this.title,
    required this.summary,
    required this.description,
    this.defaultStartDate,
    this.defaultEndDate,
    this.fixedDays,
    this.fixedNights,
    required this.currency,
    required this.basePriceFrom,
    required this.primaryCountry,
    required this.primaryCity,
    required this.destinationLabel,
    this.coverMedia,
    required this.gallery,
    required this.attachments,
    required this.departures,
    required this.destinations,
    required this.segments,
    required this.transports,
    required this.services,
    this.pricing,
    required this.tags,
    required this.bookingModel,
    required this.dateModel,
    required this.durationModel,
    required this.journeyModel,
    required this.operationModel,
    required this.guidanceModel,
    required this.transportPolicy,
    required this.servicePolicy,
    required this.themes,
  });

  factory TourPackageModel.fromJson(Map<String, dynamic> json) {
    return TourPackageModel(
      id: json['id'] as int,
      uuid: json['uuid'] as String? ?? '',
      slug: json['slug'] as String? ?? '',
      title: LocalizedTextModel(
        fa: json['title_fa'] as String?,
        en: json['title_en'] as String?,
        ar: json['title_ar'] as String?,
      ),
      summary: LocalizedTextModel(
        fa: json['summary_fa'] as String?,
        en: json['summary_en'] as String?,
        ar: json['summary_ar'] as String?,
      ),
      description: LocalizedTextModel(
        fa: json['description_fa'] as String?,
        en: json['description_en'] as String?,
        ar: json['description_ar'] as String?,
      ),
      bookingModel: json['booking_model'] as String? ?? '',
      dateModel: json['date_model'] as String? ?? '',
      durationModel: json['duration_model'] as String? ?? '',
      journeyModel: json['journey_model'] as String? ?? '',
      operationModel: json['operation_model'] as String? ?? '',
      guidanceModel: json['guidance_model'] as String? ?? '',
      transportPolicy: json['transport_policy'] as String? ?? 'mixed',
      servicePolicy: json['service_policy'] as String? ?? 'mixed',
      defaultStartDate: json['default_start_date'] as String?,
      defaultEndDate: json['default_end_date'] as String?,
      fixedDays: json['fixed_days'] as int?,
      fixedNights: json['fixed_nights'] as int?,
      currency: json['currency'] as String? ?? '',
      basePriceFrom: json['base_price_from'] as num? ?? 0,
      primaryCountry: json['primary_country'] as String? ?? '',
      primaryCity: json['primary_city'] as String? ?? '',
      destinationLabel: json['destination_label'] as String? ?? '',
      coverMedia: json['media']?['cover'] != null
          ? CoverMediaModel.fromJson(json['media']['cover'])
          : null,
      gallery: ((json['media']?['gallery'] as List?) ?? [])
          .map((item) => CoverMediaModel.fromJson(item))
          .toList(),
      attachments: ((json['media']?['attachment'] as List?) ?? [])
          .map((item) => TourAttachmentModel.fromJson(item))
          .toList(),
      departures: ((json['departures']?['items'] as List?) ?? [])
          .map((item) => TourDepartureModel.fromJson(item))
          .toList(),
      destinations: (json['destinations'] as List? ?? [])
          .map((x) => DestinationModel.fromJson(x))
          .toList(),
      segments: (json['segments'] as List? ?? [])
          .map((x) => SegmentModel.fromJson(x))
          .toList(),
      transports: (json['transports']?['items'] as List? ?? [])
          .map((x) => TransportModel.fromJson(x))
          .toList(),
      services: (json['services']?['items'] as List? ?? [])
          .map((x) => ServiceModel.fromJson(x))
          .toList(),
      tags: (json['tags'] as List? ?? [])
          .map((x) => TagModel.fromJson(x))
          .toList(),
      themes: (json['themes_json'] as List? ?? []).whereType<String>().toList(),
      pricing: json['pricing'] != null
          ? PackagePricingModel.fromJson(json['pricing'])
          : null,
    );
  }
}
