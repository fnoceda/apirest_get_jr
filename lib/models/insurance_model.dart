import 'dart:convert';

import 'package:equatable/equatable.dart';

class InsuranceModel extends Equatable {
  final int id;
  final String name;
  final String description;

  const InsuranceModel({
    required this.id,
    required this.name,
    required this.description,
  });

  @override
  List<Object?> get props => [id, name, description];

  @override
  String toString() =>
      'Insurance(id: $id, name: $name, description: $description)';

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    result.addAll({'id': id});
    result.addAll({'name': name});
    result.addAll({'description': description});

    return result;
  }

  factory InsuranceModel.fromMap(Map<String, dynamic> map) {
    return InsuranceModel(
      id: map['id']?.toInt() ?? 0,
      name: map['name'] ?? '',
      description: map['description'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory InsuranceModel.fromJson(String source) =>
      InsuranceModel.fromMap(json.decode(source));

  InsuranceModel copyWith({
    int? id,
    String? name,
    String? description,
  }) {
    return InsuranceModel(
      id: id ?? this.id,
      name: name ?? this.name,
      description: description ?? this.description,
    );
  }
}
