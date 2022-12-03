import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'otro_bloc_event.dart';
part 'otro_bloc_state.dart';

class OtroBlocBloc extends Bloc<OtroBlocEvent, OtroBlocState> {
  OtroBlocBloc() : super(OtroBlocInitial()) {
    on<OtroBlocEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
