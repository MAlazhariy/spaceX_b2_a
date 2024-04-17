import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

part 'rocket_event.dart';
part 'rocket_state.dart';

class RocketBloc extends Bloc<RocketEvent, RocketState> {
  RocketBloc() : super(RocketState()) {
    on<RocketEvent>((event, emit) {
    });
  }
}
