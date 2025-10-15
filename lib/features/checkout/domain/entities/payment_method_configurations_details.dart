part of '../../imports.dart';

class PaymentMethodConfigurationDetails extends Equatable {
  final String id;
  final String? parent;

  const PaymentMethodConfigurationDetails({required this.id, this.parent});

  @override
  List<Object?> get props => [id, parent];
}
