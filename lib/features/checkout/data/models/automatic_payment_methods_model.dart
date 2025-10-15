part of '../../imports.dart';

class AutomaticPaymentMethodsModel extends AutomaticPaymentMethods {
  const AutomaticPaymentMethodsModel({required super.allowRedirects, required super.enabled});

  factory AutomaticPaymentMethodsModel.fromEntity(AutomaticPaymentMethods entity) {
    return AutomaticPaymentMethodsModel(allowRedirects: entity.allowRedirects, enabled: entity.enabled);
  }

  factory AutomaticPaymentMethodsModel.fromMap(Map<String, dynamic> map) {
    return AutomaticPaymentMethodsModel(allowRedirects: map['allow_redirects'] as String, enabled: map['enabled'] as bool);
  }

  factory AutomaticPaymentMethodsModel.fromJson(String source) {
    return AutomaticPaymentMethodsModel.fromMap(json.decode(source) as Map<String, dynamic>);
  }

  Map<String, dynamic> toMap() {
    return {'allow_redirects': allowRedirects, 'enabled': enabled};
  }

  String toJson() => json.encode(toMap());
}
