part of 'suggestion_bloc.dart';

sealed class SuggestionEvent {}

/// Fetch the suggestions.
final class FetchSuggestionEvent extends SuggestionEvent {}
