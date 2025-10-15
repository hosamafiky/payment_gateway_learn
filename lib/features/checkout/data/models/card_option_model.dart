part of '../../imports.dart';

class CardOptionModel extends CardOption {
  const CardOptionModel({super.installments, super.mandateOptions, super.network, required super.requestThreeDSecure});

  factory CardOptionModel.fromEntity(CardOption entity) {
    return CardOptionModel(
      installments: entity.installments,
      mandateOptions: entity.mandateOptions,
      network: entity.network,
      requestThreeDSecure: entity.requestThreeDSecure,
    );
  }

  factory CardOptionModel.fromMap(Map<String, dynamic> map) {
    return CardOptionModel(
      installments: map['installments'],
      mandateOptions: map['mandate_options'],
      network: map['network'],
      requestThreeDSecure: map['request_three_d_secure'] ?? 'automatic',
    );
  }

  factory CardOptionModel.fromJson(String source) {
    return CardOptionModel.fromMap(json.decode(source) as Map<String, dynamic>);
  }

  Map<String, dynamic> toMap() {
    return {'installments': installments, 'mandate_options': mandateOptions, 'network': network, 'request_three_d_secure': requestThreeDSecure};
  }

  String toJson() => json.encode(toMap());
}
