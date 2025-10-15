part of '../../imports.dart';

class PaymentMethodConfigurationDetailsModel extends PaymentMethodConfigurationDetails {
  const PaymentMethodConfigurationDetailsModel({required super.id, super.parent});

  factory PaymentMethodConfigurationDetailsModel.fromEntity(PaymentMethodConfigurationDetails entity) {
    return PaymentMethodConfigurationDetailsModel(id: entity.id, parent: entity.parent);
  }

  factory PaymentMethodConfigurationDetailsModel.fromMap(Map<String, dynamic> map) {
    return PaymentMethodConfigurationDetailsModel(id: map['id'] as String, parent: map['parent'] != null ? map['parent'] as String : null);
  }

  factory PaymentMethodConfigurationDetailsModel.fromJson(String source) {
    return PaymentMethodConfigurationDetailsModel.fromMap(json.decode(source) as Map<String, dynamic>);
  }

  Map<String, dynamic> toMap() {
    return {'id': id, if (parent != null) 'parent': parent};
  }

  String toJson() => json.encode(toMap());
}
