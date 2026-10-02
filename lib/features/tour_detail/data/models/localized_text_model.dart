class LocalizedTextModel {
  final String? fa;
  final String? en;
  final String? ar;

  const LocalizedTextModel({this.fa, this.en, this.ar});

  String get displayValue => en ?? ar ?? fa ?? '';

  factory LocalizedTextModel.fromJson(dynamic json) {
    if (json == null) return const LocalizedTextModel();
    if (json is String) return LocalizedTextModel(en: json);
    return LocalizedTextModel(
      fa: json['fa'] as String?,
      en: json['en'] as String?,
      ar: json['ar'] as String?,
    );
  }

  Map<String, dynamic> toJson() => {'fa': fa, 'en': en, 'ar': ar};
}
