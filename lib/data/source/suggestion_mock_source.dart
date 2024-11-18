import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:wedding/domain/repo/suggestion_repo.dart';
import 'package:wedding/domain/schema/suggestion_schema.dart';
import 'package:wedding/domain/schema/suggestion_type_schema.dart';

typedef LastFetchedDocument = QueryDocumentSnapshot?;

class SuggestionSource implements SuggestionRepo<LastFetchedDocument> {
  @override
  Future<List<SuggestionSchema>> fetchSuggestions(
    final LastFetchedDocument params,
  ) async {
    // TODO: implement fetchSuggestions
    throw UnimplementedError();
  }

  @override
  Future<SuggestionTypeSchema> suggestionType() async {
    throw UnimplementedError();
  }
}
