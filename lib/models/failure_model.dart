import 'dart:convert';

import 'package:equatable/equatable.dart';

class FailureModel extends Equatable {
  int code;
  String message;
  FailureModel({
    required this.code,
    required this.message,
  });

  @override
  List<Object?> get props => [code, message];

  @override
  String toString() => 'Failure(code: $code, message: $message)';

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    result.addAll({'code': code});
    result.addAll({'message': message});

    return result;
  }

  factory FailureModel.fromMap(Map<String, dynamic> map) {
    return FailureModel(
      code: map['code']?.toInt() ?? 0,
      message: map['message'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory FailureModel.fromJson(String source) =>
      FailureModel.fromMap(json.decode(source));

  FailureModel copyWith({
    int? code,
    String? message,
  }) {
    return FailureModel(
      code: code ?? this.code,
      message: message ?? this.message,
    );
  }
}
