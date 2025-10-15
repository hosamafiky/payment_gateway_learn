part of '../../imports.dart';

class AutomaticPaymentMethods extends Equatable {
  final String allowRedirects;
  final bool enabled;

  const AutomaticPaymentMethods({required this.allowRedirects, required this.enabled});

  @override
  List<Object?> get props => [allowRedirects, enabled];
}
