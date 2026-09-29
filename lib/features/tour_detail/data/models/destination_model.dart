import 'localized_text_model.dart';

class DestinationModel {
  final int id;
  final String uuid;
  final String slug;
  final LocalizedTextModel title;
  final LocalizedTextModel summary;
  final String destinationType;
  final String countryCode;
  final LocalizedTextModel countryName;
  final LocalizedTextModel cityName;
  final double? latitude;
  final double? longitude;
  final bool isPrimary;
  final int sortOrder;

  const DestinationModel({
    required this.id,
    required this.uuid,
    required this.slug,
    required this.title,
    required this.summary,
    required this.destinationType,
    required this.countryCode,
    required this.countryName,
    required this.cityName,
    this.latitude,
    this.longitude,
    required this.isPrimary,
    required this.sortOrder,
  });

  factory DestinationModel.fromJson(Map<String, dynamic> json) {
    return DestinationModel(
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
      destinationType: json['destination_type'] as String? ?? '',
      countryCode: json['country_code'] as String? ?? '',
      countryName: LocalizedTextModel(
        fa: json['country_name_fa'] as String?,
        en: json['country_name_en'] as String?,
        ar: json['country_name_ar'] as String?,
      ),
      cityName: LocalizedTextModel(
        fa: json['city_name_fa'] as String?,
        en: json['city_name_en'] as String?,
        ar: json['city_name_ar'] as String?,
      ),
      latitude: (json['latitude'] as num?)?.toDouble(),
      longitude: (json['longitude'] as num?)?.toDouble(),
      isPrimary: (json['is_primary'] as int? ?? 0) == 1,
      sortOrder: json['sort_order'] as int? ?? 0,
    );
  }
}
