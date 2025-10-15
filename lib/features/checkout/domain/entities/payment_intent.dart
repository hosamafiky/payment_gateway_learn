part of '../../imports.dart';

class PaymentIntent extends Equatable {
  final String id;
  final String object;
  final int amount;
  final int amountCapturable;
  final AmountDetails amountDetails;
  final int amountReceived;
  final String? application;
  final int? applicationFeeAmount;
  final AutomaticPaymentMethods automaticPaymentMethods;
  final int? canceledAt;
  final String? cancellationReason;
  final String captureMethod;
  final String clientSecret;
  final String confirmationMethod;
  final int created;
  final String currency;
  final String? customer;
  final String? description;
  final List<String>? excludedPaymentMethodTypes;
  final String? lastPaymentError;
  final String? latestCharge;
  final bool livemode;
  final Map<String, dynamic> metadata;
  final String? nextAction;
  final String? onBehalfOf;
  final String? paymentMethod;
  final PaymentMethodConfigurationDetails paymentMethodConfigurationDetails;
  final PaymentMethodOptions paymentMethodOptions;
  final List<String> paymentMethodTypes;
  final String? processing;
  final String? receiptEmail;
  final String? review;
  final String? setupFutureUsage;
  final String? shipping;
  final String? source;
  final String? statementDescriptor;
  final String? statementDescriptorSuffix;
  final String status;
  final String? transferData;
  final String? transferGroup;

  const PaymentIntent({
    required this.id,
    required this.object,
    required this.amount,
    required this.amountCapturable,
    required this.amountDetails,
    required this.amountReceived,
    this.application,
    this.applicationFeeAmount,
    required this.automaticPaymentMethods,
    this.canceledAt,
    this.cancellationReason,
    required this.captureMethod,
    required this.clientSecret,
    required this.confirmationMethod,
    required this.created,
    required this.currency,
    this.customer,
    this.description,
    this.excludedPaymentMethodTypes,
    this.lastPaymentError,
    this.latestCharge,
    required this.livemode,
    required this.metadata,
    this.nextAction,
    this.onBehalfOf,
    this.paymentMethod,
    required this.paymentMethodConfigurationDetails,
    required this.paymentMethodOptions,
    required this.paymentMethodTypes,
    this.processing,
    this.receiptEmail,
    this.review,
    this.setupFutureUsage,
    this.shipping,
    this.source,
    this.statementDescriptor,
    this.statementDescriptorSuffix,
    required this.status,
    this.transferData,
    this.transferGroup,
  });

  @override
  List<Object?> get props => [
    id,
    object,
    amount,
    amountCapturable,
    amountDetails,
    amountReceived,
    application,
    applicationFeeAmount,
    automaticPaymentMethods,
    canceledAt,
    cancellationReason,
    captureMethod,
    clientSecret,
    confirmationMethod,
    created,
    currency,
    customer,
    description,
    excludedPaymentMethodTypes,
    lastPaymentError,
    latestCharge,
    livemode,
    metadata,
    nextAction,
    onBehalfOf,
    paymentMethod,
    paymentMethodConfigurationDetails,
    paymentMethodOptions,
    paymentMethodTypes,
    processing,
    receiptEmail,
    review,
    setupFutureUsage,
    shipping,
    source,
    statementDescriptor,
    statementDescriptorSuffix,
    status,
    transferData,
    transferGroup,
  ];
}
