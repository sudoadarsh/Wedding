interface class SuggestionSchema {
  /// The suggestion id.
  int? id;

  /// The userId.
  String? userId;

  /// The name of the user.
  String? author;

  /// The suggestion. 120 char limit.
  String? suggestion;

  /// The likes. Array of the userIds.
  List<String>? likes;

  /// The dislikes. Array of the userIds.
  List<String>? dislikes;
}
