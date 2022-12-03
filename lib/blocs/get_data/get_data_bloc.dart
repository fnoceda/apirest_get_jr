import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:jr/api/insurance_api.dart';
import 'package:jr/models/failure_model.dart';
import 'package:jr/models/insurance_model.dart';

part 'get_data_event.dart';
part 'get_data_state.dart';

class GetDataBloc extends Bloc<GetDataEvent, GetDataState> {
  GetDataBloc() : super(GetDataState.initial()) {
    on<DataClearEvent>((event, emit) {
      emit(state.copyWith(
        httpStatus: HttpStatus.none,
        message: null,
        lista: [],
      ));
    });

    on<DataLoadingEvent>((event, emit) {
      emit(state.copyWith(
        httpStatus: HttpStatus.none,
      ));
    });

    on<DataLoadingFailEvent>((event, emit) {
      emit(state.copyWith(
        httpStatus: HttpStatus.failed,
        message: event.errorMessage,
      ));
    });

    on<DataSuccessEvent>((event, emit) {
      emit(state.copyWith(
        httpStatus: HttpStatus.success,
        lista: event.lista,
      ));
    });
  }

  Future<List<InsuranceModel>> getData() async {
    Either<FailureModel, List<InsuranceModel>> result =
        await InsuranceApi.getInsurances();

    add(DataLoadingEvent());

    List<InsuranceModel> rta = [];
    result.fold((l) {
      print('entra en falla');
      add(DataLoadingFailEvent(errorMessage: 'Error al traer los datos'));
    }, (r) {
      print('entra en ok');
      add(DataSuccessEvent(lista: r));
      rta = r;
    });

    print('rta => $rta');

    return rta;
  }
}
