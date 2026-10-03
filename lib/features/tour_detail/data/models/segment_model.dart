import 'localized_text_model.dart';
import 'destination_model.dart';

class SegmentModel {
  final int id;
  final String uuid;
  final LocalizedTextModel title;
  final LocalizedTextModel description;
  final DestinationModel? destination;
  final int sortOrder;
  final String? startDate;
  final String? endDate;
  final int? fixedDays;
  final int? fixedNights;

  const SegmentModel({
    required this.id,
    required this.uuid,
    required this.title,
    required this.description,
    this.destination,
    required this.sortOrder,
    this.startDate,
    this.endDate,
    required this.fixedDays,
    required this.fixedNights,
  });

  factory SegmentModel.fromJson(Map<String, dynamic> json) {
    return SegmentModel(
      id: json['id'] as int,
      uuid: json['uuid'] as String? ?? '',
      title: LocalizedTextModel(
        fa: json['title_fa'] as String?,
        en: json['title_en'] as String?,
        ar: json['title_ar'] as String?,
      ),
      description: LocalizedTextModel(
        fa: json['description_fa'] as String?,
        en: json['description_en'] as String?,
        ar: json['description_ar'] as String?,
      ),
      destination: json['destination'] is Map<String, dynamic>
          ? DestinationModel.fromJson(json['destination'])
          : null,
      sortOrder: json['sort_order'] as int? ?? 0,
      startDate: json['start_date'] as String?,
      endDate: json['end_date'] as String?,
      fixedDays: json['fixed_days'] as int? ?? 0,
      fixedNights: json['fixed_nights'] as int? ?? 0,
    );
  }
}

class SegmentReferenceModel {
  final int? id;
  final String? uuid;
  final int? sortOrder;
  final LocalizedTextModel title;

  const SegmentReferenceModel({
    this.id,
    this.uuid,
    this.sortOrder,
    required this.title,
  });

  factory SegmentReferenceModel.fromJson(Map<String, dynamic> json) {
    return SegmentReferenceModel(
      id: json['id'] as int?,
      uuid: json['uuid'] as String?,
      sortOrder: json['sort_order'] as int?,
      title: LocalizedTextModel.fromJson(json['title']),
    );
  }
}
