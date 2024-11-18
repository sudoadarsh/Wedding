import '../schema/suggestion_schema.dart';
import '../schema/suggestion_type_schema.dart';

abstract interface class SuggestionRepo<PaginationParam> {
  /// Fetch the active suggestion type and related details.
  Future<SuggestionTypeSchema> suggestionType();

  /// Fetch suggestions.
  /// * [params] : The custom params required to fetch paginated suggestion listing.
  Future<List<SuggestionSchema>> fetchSuggestions(final PaginationParam params);
}
