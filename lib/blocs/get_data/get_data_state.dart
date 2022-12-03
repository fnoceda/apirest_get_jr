part of 'get_data_bloc.dart';

enum HttpStatus { none, loading, failed, success }

class GetDataState extends Equatable {
  HttpStatus httpStatus;
  String? message;
  List<InsuranceModel> lista;

  GetDataState({
    required this.httpStatus,
    required this.lista,
    this.message,
  });

  factory GetDataState.initial() {
    return GetDataState(httpStatus: HttpStatus.none, lista: []);
  }

  @override
  List<Object?> get props => [httpStatus, message, lista];

  @override
  String toString() =>
      'GetDataState(httpStatus: $httpStatus, message: $message, lista: $lista)';

  GetDataState copyWith({
    HttpStatus? httpStatus,
    String? message,
    List<InsuranceModel>? lista,
  }) {
    return GetDataState(
      httpStatus: httpStatus ?? this.httpStatus,
      message: message ?? this.message,
      lista: lista ?? this.lista,
    );
  }
}
