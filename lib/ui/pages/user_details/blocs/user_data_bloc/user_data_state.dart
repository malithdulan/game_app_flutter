part of 'user_data_bloc.dart';

class UserDataState extends Equatable {
  final UserData? userData;
  final LOADING_STATUS status;

  const UserDataState({this.userData, this.status = LOADING_STATUS.initial});

  @override
  List<Object?> get props => [userData, status];

  UserDataState copyWith({UserData? data, LOADING_STATUS? status}) {
    return UserDataState(
        userData: data ?? userData, status: status ?? this.status);
  }
}
