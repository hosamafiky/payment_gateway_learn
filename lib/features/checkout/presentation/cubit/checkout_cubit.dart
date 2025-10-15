part of '../../imports.dart';

class CheckoutCubit extends Cubit<CheckoutState> {
  CheckoutCubit({required CheckoutRepository repository}) : super(CheckoutState()) {
    handlePaymentUsecase = HandlePaymentUsecase(repository: repository);
  }

  late final HandlePaymentUsecase handlePaymentUsecase;

  Future<void> handlePayment(PaymentIntentParams params) async {
    emit(state.copyWith(status: CheckoutStatus.loading));
    final result = await handlePaymentUsecase(params);
    result.fold(
      (failure) => emit(state.copyWith(status: CheckoutStatus.failure, failure: failure)),
      (paymentOption) => emit(state.copyWith(status: CheckoutStatus.success, message: 'Payment successful')),
    );
  }
}
