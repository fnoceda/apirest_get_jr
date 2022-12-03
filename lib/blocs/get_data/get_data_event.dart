part of 'get_data_bloc.dart';

abstract class GetDataEvent extends Equatable {
  const GetDataEvent();

  @override
  List<Object> get props => [];
}

class DataClearEvent extends GetDataEvent {
  DataClearEvent();
}

class DataLoadingEvent extends GetDataEvent {
  DataLoadingEvent();
}

class DataLoadingFailEvent extends GetDataEvent {
  final String errorMessage;
  DataLoadingFailEvent({required this.errorMessage});
}

class DataSuccessEvent extends GetDataEvent {
  final List<InsuranceModel> lista;
  DataSuccessEvent({required this.lista});
}
