part of '../../imports.dart';

class KlarnaOption extends Equatable {
  final String? preferredLocale;

  const KlarnaOption({this.preferredLocale});

  @override
  List<Object?> get props => [preferredLocale];
}
