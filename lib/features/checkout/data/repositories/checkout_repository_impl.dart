part of '../../imports.dart';

class CheckoutRepositoryImpl implements CheckoutRepository {
  final StripeHelper stripeHelper = StripeHelper();
  @override
  Future<Either<Failure, PaymentSheetPaymentOption?>> handlePayment(PaymentIntentParams params) async {
    try {
      // Call the payment processing API
      return Right(await stripeHelper.handlePayment(params));
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }
}
