part of '../../imports.dart';

class HandlePaymentUsecase {
  final CheckoutRepository repository;

  const HandlePaymentUsecase({required this.repository});

  Future<Either<Failure, PaymentSheetPaymentOption?>> call(PaymentIntentParams params) async {
    return await repository.handlePayment(params);
  }
}

class PaymentIntentParams {
  final num amount;
  final String currencyISOCode;

  const PaymentIntentParams({required this.amount, required this.currencyISOCode});

  PaymentIntentParams copyWith({num? amount, String? currencyISOCode}) {
    return PaymentIntentParams(amount: amount ?? this.amount, currencyISOCode: currencyISOCode ?? this.currencyISOCode);
  }

  String get customerID => dotenv.env['CUSTOMER_ID']!;

  Map<String, dynamic> toMap() {
    return {'amount': (amount * 100).round().toString(), 'currency': currencyISOCode, 'customer': customerID, 'automatic_payment_methods[enabled]': 'true'};
  }
}
