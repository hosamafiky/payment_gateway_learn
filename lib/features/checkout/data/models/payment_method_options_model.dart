part of '../../imports.dart';

class PaymentMethodOptionsModel extends PaymentMethodOptions {
  const PaymentMethodOptionsModel({required super.amazonPay, required super.card, required super.klarna, required super.link});

  factory PaymentMethodOptionsModel.fromEntity(PaymentMethodOptions entity) {
    return PaymentMethodOptionsModel(amazonPay: entity.amazonPay, card: entity.card, klarna: entity.klarna, link: entity.link);
  }

  factory PaymentMethodOptionsModel.fromMap(Map<String, dynamic> map) {
    return PaymentMethodOptionsModel(
      amazonPay: AmazonPayOptionModel.fromMap(Map<String, dynamic>.from(map['amazon_pay'] as Map)),
      card: CardOptionModel.fromMap(Map<String, dynamic>.from(map['card'] as Map)),
      klarna: KlarnaOptionModel.fromMap(Map<String, dynamic>.from(map['klarna'] as Map)),
      link: LinkOptionModel.fromMap(Map<String, dynamic>.from(map['link'] as Map)),
    );
  }

  factory PaymentMethodOptionsModel.fromJson(String source) {
    return PaymentMethodOptionsModel.fromMap(json.decode(source) as Map<String, dynamic>);
  }

  Map<String, dynamic> toMap() {
    return {
      'amazon_pay': AmazonPayOptionModel.fromEntity(amazonPay).toMap(),
      'card': CardOptionModel.fromEntity(card).toMap(),
      'klarna': KlarnaOptionModel.fromEntity(klarna).toMap(),
      'link': LinkOptionModel.fromEntity(link).toMap(),
    };
  }

  String toJson() => json.encode(toMap());
}
