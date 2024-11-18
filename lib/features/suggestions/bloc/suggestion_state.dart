part of 'suggestion_bloc.dart';

sealed class SuggestionState {}

final class SuggestionInitial extends SuggestionState {}

/// Suggestion fetch states.
final class FetchingSuggestionsState extends SuggestionState {}

final class SuggestionsFetchedState extends SuggestionState {}

final class ErrorFetchingSuggestionsState extends SuggestionState {}