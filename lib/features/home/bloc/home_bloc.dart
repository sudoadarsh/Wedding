import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {

  HomeBloc() : super(HomeInitial()) {
    // Fetch the timer.
    on<FetchTimerEvent>((event, emit) async {
      emit(FetchingTimerState());
      // TODO: Change later.
      emit(TimerFetchedState());
    });
  }
}
