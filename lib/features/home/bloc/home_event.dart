part of 'home_bloc.dart';

@immutable
sealed class HomeEvent {}

/// Fetch the timer.
class FetchTimerEvent extends HomeEvent {}
