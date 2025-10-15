part of '../../imports.dart';

class CardOption extends Equatable {
  final String? installments;
  final String? mandateOptions;
  final String? network;
  final String requestThreeDSecure;

  const CardOption({this.installments, this.mandateOptions, this.network, required this.requestThreeDSecure});

  @override
  List<Object?> get props => [installments, mandateOptions, network, requestThreeDSecure];
}
