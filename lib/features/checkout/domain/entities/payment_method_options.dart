part of '../../imports.dart';

class PaymentMethodOptions extends Equatable {
  final AmazonPayOption amazonPay;
  final CardOption card;
  final KlarnaOption klarna;
  final LinkOption link;

  const PaymentMethodOptions({required this.amazonPay, required this.card, required this.klarna, required this.link});

  @override
  List<Object?> get props => [amazonPay, card, klarna, link];
}
