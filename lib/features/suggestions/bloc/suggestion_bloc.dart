import 'package:wedding/domain/schema/suggestion_schema.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'suggestion_event.dart';

part 'suggestion_state.dart';

class SuggestionBloc extends Bloc<SuggestionEvent, SuggestionState> {
  /// The in-memory cache of suggestions.
  final List<SuggestionSchema> suggestions = List.empty(growable: true);

  SuggestionBloc() : super(SuggestionInitial()) {
    /// Fetch the suggestions.
    on<FetchSuggestionEvent>((event, emit) {});
  }
}
