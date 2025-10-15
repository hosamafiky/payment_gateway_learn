part of '../../imports.dart';

class AmazonPayOption extends Equatable {
  final String? expressCheckoutElementSessionId;

  const AmazonPayOption({this.expressCheckoutElementSessionId});

  @override
  List<Object?> get props => [expressCheckoutElementSessionId];
}
