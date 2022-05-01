import 'package:equatable/equatable.dart';

class AppSettings extends Equatable {
  final String? versionNumber;
  final String? buildNumber;

  const AppSettings({required this.versionNumber, required this.buildNumber});

  @override
  List<Object?> get props => [versionNumber, buildNumber];
}
