import 'package:equatable/equatable.dart';

class UserData extends Equatable {
  final String? name;
  final String? email;
  final String? accountType;

  const UserData(
      {required this.name, required this.email, required this.accountType});

  @override
  List<Object?> get props => [name, email, accountType];
}
