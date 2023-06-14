part of openthesaurus.models;

@JsonSerializable(createToJson: false)
class Term {
  factory Term.fromJson(Map<String, dynamic> json) => _$TermFromJson(json);
  Term();

  String? term;
}

@JsonSerializable(createToJson: false)
class SimilarTerm extends Term {
  factory SimilarTerm.fromJson(Map<String, dynamic> json) =>
      _$SimilarTermFromJson(json);
  SimilarTerm();

  int? distance;
}

@JsonSerializable(createToJson: false)
class SynonymTerm extends Term {
  static Level? _levelFromJson(String? json) =>
      json != null ? Level.fromKey(json) : null;

  factory SynonymTerm.fromJson(Map<String, dynamic> json) =>
      _$SynonymTermFromJson(json);

  SynonymTerm();

  @JsonKey(fromJson: _levelFromJson)
  Level? level;
}

enum Level {
  colloquial(key: 'umgangssprachlich'),
  technical(key: 'fachsprachlich'),
  rough(key: 'derb'),
  exalted(key: 'gehoben');

  const Level({required String key}) : _key = key;

  final String _key;

  static Level fromKey(String key) =>
      values.firstWhere((element) => element._key == key);
}
