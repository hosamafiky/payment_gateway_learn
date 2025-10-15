part of '../../imports.dart';

class LinkOption extends Equatable {
  final String? persistentToken;

  const LinkOption({this.persistentToken});

  @override
  List<Object?> get props => [persistentToken];
}
