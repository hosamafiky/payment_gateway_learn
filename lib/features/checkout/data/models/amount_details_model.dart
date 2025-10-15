part of '../../imports.dart';

class AmountDetailsModel extends AmountDetails {
  const AmountDetailsModel({required super.tip});

  factory AmountDetailsModel.fromEntity(AmountDetails entity) {
    return AmountDetailsModel(tip: entity.tip);
  }

  factory AmountDetailsModel.fromMap(Map<String, dynamic> map) {
    return AmountDetailsModel(tip: Map<String, dynamic>.from(map['tip'] as Map));
  }

  factory AmountDetailsModel.fromJson(String source) {
    return AmountDetailsModel.fromMap(json.decode(source) as Map<String, dynamic>);
  }

  Map<String, dynamic> toMap() {
    return {'tip': tip};
  }

  String toJson() => json.encode(toMap());
}
