import 'package:rehletna_mobile/features/tour_detail/data/models/localized_text_model.dart';

class TagModel {
  final int id;
  final String uuid;
  final String slug;
  final LocalizedTextModel name;
  final LocalizedTextModel description;
  final String tagGroup;
  final num isFeatured;
  final num sortOrder;

  TagModel({
    required this.id,
    required this.uuid,
    required this.slug,
    required this.name,
    required this.description,
    required this.tagGroup,
    required this.isFeatured,
    required this.sortOrder,
  });

  factory TagModel.fromJson(Map<String, dynamic> json) {
    return TagModel(
      id: json['id'] as int,
      uuid: json['uuid'] as String? ?? '',
      slug: json['slug'] as String? ?? '',
      tagGroup: json['tag_group'] as String? ?? '',
      isFeatured: json['is_featured'] as num,
      name: LocalizedTextModel(
        fa: json['name_fa'] as String?,
        en: json['name_en'] as String?,
        ar: json['name_ar'] as String?,
      ),
      description: LocalizedTextModel(
        fa: json['description_fa'] as String?,
        en: json['description_en'] as String?,
        ar: json['description_ar'] as String?,
      ),
      sortOrder: json['sort_order'] as int? ?? 0,
    );
  }
}
