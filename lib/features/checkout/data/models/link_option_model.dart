part of '../../imports.dart';

class LinkOptionModel extends LinkOption {
  const LinkOptionModel({super.persistentToken});

  factory LinkOptionModel.fromEntity(LinkOption entity) {
    return LinkOptionModel(persistentToken: entity.persistentToken);
  }

  factory LinkOptionModel.fromMap(Map<String, dynamic> map) {
    return LinkOptionModel(persistentToken: map['persistent_token'] as String?);
  }

  factory LinkOptionModel.fromJson(String source) {
    return LinkOptionModel.fromMap(json.decode(source) as Map<String, dynamic>);
  }

  Map<String, dynamic> toMap() {
    return {'persistent_token': persistentToken};
  }

  String toJson() => json.encode(toMap());
}
