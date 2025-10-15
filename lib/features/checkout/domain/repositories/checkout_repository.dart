part of '../../imports.dart';

abstract class CheckoutRepository {
  Future<Either<Failure, PaymentSheetPaymentOption?>> handlePayment(PaymentIntentParams params);
}
