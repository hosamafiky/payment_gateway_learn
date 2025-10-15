part of '../../imports.dart';

class KlarnaOptionModel extends KlarnaOption {
  const KlarnaOptionModel({super.preferredLocale});

  factory KlarnaOptionModel.fromEntity(KlarnaOption entity) {
    return KlarnaOptionModel(preferredLocale: entity.preferredLocale);
  }

  factory KlarnaOptionModel.fromMap(Map<String, dynamic> map) {
    return KlarnaOptionModel(preferredLocale: map['preferred_locale'] as String?);
  }

  factory KlarnaOptionModel.fromJson(String source) {
    return KlarnaOptionModel.fromMap(json.decode(source) as Map<String, dynamic>);
  }

  Map<String, dynamic> toMap() {
    return {'preferred_locale': preferredLocale};
  }

  String toJson() => json.encode(toMap());
}
