interface class SuggestionTypeSchema {
  /// The id.
  String? id;

  /// The type. Eg., Wedding Shoe Game.
  String? title;

  /// The hint text. Eg., Your question
  String? hintText;

  /// Very brief description of the user input
  String? hintDescription;

  /// The rules.
  List<SuggestionTypeRules>? rules;
}

interface class SuggestionTypeRules {
  /// The title.
  String? title;

  /// The rules.
  List<String>? rules;
}
