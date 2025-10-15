part of '../../imports.dart';

enum CheckoutStatus { initial, loading, success, failure }

class CheckoutState extends Equatable {
  const CheckoutState({this.status = CheckoutStatus.initial, this.failure, this.message});

  final CheckoutStatus status;
  final Failure? failure;
  final String? message;

  CheckoutState copyWith({CheckoutStatus? status, Failure? failure, String? message}) {
    return CheckoutState(status: status ?? this.status, failure: failure, message: message);
  }

  @override
  List<Object?> get props => [status, failure];
}
