class InitPaymentSheetParams {
  final String paymentIntentClientSecret;
  final String? customerId;
  final String? customerEphemeralKeySecret;

  const InitPaymentSheetParams({required this.paymentIntentClientSecret, this.customerId, this.customerEphemeralKeySecret});
}
