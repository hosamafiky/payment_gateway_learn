part of '../../imports.dart';

class AmazonPayOptionModel extends AmazonPayOption {
  const AmazonPayOptionModel({super.expressCheckoutElementSessionId});

  factory AmazonPayOptionModel.fromEntity(AmazonPayOption entity) {
    return AmazonPayOptionModel(expressCheckoutElementSessionId: entity.expressCheckoutElementSessionId);
  }

  factory AmazonPayOptionModel.fromMap(Map<String, dynamic> map) {
    return AmazonPayOptionModel(expressCheckoutElementSessionId: map['express_checkout_element_session_id'] as String?);
  }

  factory AmazonPayOptionModel.fromJson(String source) {
    return AmazonPayOptionModel.fromMap(json.decode(source) as Map<String, dynamic>);
  }

  Map<String, dynamic> toMap() {
    return {'express_checkout_element_session_id': expressCheckoutElementSessionId};
  }

  String toJson() => json.encode(toMap());
}
