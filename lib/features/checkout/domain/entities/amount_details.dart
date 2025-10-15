part of '../../imports.dart';

class AmountDetails extends Equatable {
  final Map<String, dynamic> tip;

  const AmountDetails({required this.tip});

  @override
  List<Object?> get props => [tip];
}
