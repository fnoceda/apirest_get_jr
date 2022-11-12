import 'dart:convert';

import 'package:equatable/equatable.dart';

class ResultModel extends Equatable {
  final bool success;
  final String message;
  final dynamic data;
  const ResultModel({
    required this.success,
    required this.message,
    required this.data,
  });

  @override
  List<Object?> get props => [];

  @override
  String toString() =>
      'ResultModel(success: $success, message: $message, data: $data)';

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    result.addAll({'success': success});
    result.addAll({'message': message});
    result.addAll({'data': data});

    return result;
  }

  factory ResultModel.fromMap(Map<String, dynamic> map) {
    return ResultModel(
      success: map['success'] ?? false,
      message: map['message'] ?? '',
      data: map['data'] ?? null,
    );
  }

  String toJson() => json.encode(toMap());

  factory ResultModel.fromJson(String source) =>
      ResultModel.fromMap(json.decode(source));
}
