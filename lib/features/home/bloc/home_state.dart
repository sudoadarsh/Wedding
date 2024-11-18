part of 'home_bloc.dart';

sealed class HomeState {}

final class HomeInitial extends HomeState {}

/// The timer fetch states.
final class TimerState extends HomeState {}

final class FetchingTimerState extends TimerState {}

final class TimerFetchedState extends TimerState {}

final class ErrorFetchingTimerState extends TimerState {
  final Object? error;

  ErrorFetchingTimerState({required this.error});
}
