part of openthesaurus.models;

/// Most simple class that represents a term (synonyme, similar written word etc.)
@JsonSerializable(createToJson: false)
class Term {
  factory Term.fromJson(Map<String, dynamic> json) => _$TermFromJson(json);
  Term();

  String? term;
}

/// Json representation of a term that is similar to the queried word.
@JsonSerializable(createToJson: false)
class SimilarTerm extends Term {
  factory SimilarTerm.fromJson(Map<String, dynamic> json) =>
      _$SimilarTermFromJson(json);
  SimilarTerm();

  /// Distance to the queried word
  /// (`0` meaning very close and `>=3` meaning not close.)
  int? distance;
}

/// A term representing a synomyme.
@JsonSerializable(createToJson: false)
class SynonymTerm extends Term {
  static Level? _levelFromJson(String? json) =>
      json != null ? Level.fromKey(json) : null;

  factory SynonymTerm.fromJson(Map<String, dynamic> json) =>
      _$SynonymTermFromJson(json);

  SynonymTerm();

  /// Level of term usage. Can be [Level.colloquial],
  /// [Level.exalted], [Level.rough] or a [Level.technical] term.
  @JsonKey(fromJson: _levelFromJson)
  Level? level;
}

/// Level of usage of the word.
enum Level {
  /// A colloquial term
  colloquial(key: 'umgangssprachlich'),

  /// A technical term
  technical(key: 'fachsprachlich'),

  /// A rough term
  rough(key: 'derb'),

  /// An exalted term
  exalted(key: 'gehoben');

  const Level({required String key}) : _key = key;

  final String _key;

  static Level fromKey(String key) =>
      values.firstWhere((element) => element._key == key);
}
