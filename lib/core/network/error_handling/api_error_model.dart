import 'package:equatable/equatable.dart';

class ApiErrorModel extends Equatable {
  final String message;
  final int code;

  const ApiErrorModel(
    this.message, {
    this.code = -1,
  });

  ApiErrorModel.fromJson(
    Map<String, dynamic> json, {
    int? code,
    String? message,
  })  : message = message ?? json['message'],
        code = code ?? json['code'];

  @override
  List<Object?> get props => [
    message,
    code,
  ];
}
