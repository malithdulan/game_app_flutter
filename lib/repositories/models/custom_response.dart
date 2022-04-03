import 'package:equatable/equatable.dart';

class CustomResponse extends Equatable {
  final Map<String, dynamic>? responseData;
  final int? statusCode;

  const CustomResponse._privateConstructor({this.responseData, this.statusCode});

  factory CustomResponse.fromDictionary(Map<String, dynamic> response) {
    return CustomResponse._privateConstructor(
      responseData: response["body"],
      statusCode: response["statusCode"],
    );
  }

  @override
  List<Object?> get props => [responseData, statusCode];
}