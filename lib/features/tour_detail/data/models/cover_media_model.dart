class CoverMediaModel {
  final String uuid;
  final String url;
  final String mimeType;
  final String filename;

  const CoverMediaModel({
    required this.uuid,
    required this.url,
    required this.mimeType,
    required this.filename,
  });

  factory CoverMediaModel.fromJson(Map<String, dynamic> json) {
    return CoverMediaModel(
      uuid: json['uuid'] as String? ?? '',
      url: json['url'] as String? ?? '',
      mimeType: json['mime_type'] as String? ?? '',
      filename: json['filename'] as String? ?? '',
    );
  }
}

class TourAttachmentModel {
  final String uuid;
  final String url;
  final String mimeType;
  final String filename;

  const TourAttachmentModel({
    required this.uuid,
    required this.url,
    required this.mimeType,
    required this.filename,
  });

  factory TourAttachmentModel.fromJson(Map<String, dynamic> json) {
    return TourAttachmentModel(
      uuid: json['uuid'] as String? ?? '',
      url: json['url'] as String? ?? '',
      mimeType: json['mime_type'] as String? ?? '',
      filename: json['filename'] as String? ?? '',
    );
  }
}
