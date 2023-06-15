part of openthesaurus.models;

/// Json representation of the root
@JsonSerializable(createToJson: false)
class OpenThesaurusResponse {
  factory OpenThesaurusResponse.fromJson(Map<String, dynamic> json) =>
      _$OpenThesaurusResponseFromJson(json);

  OpenThesaurusResponse();

  /// The synonyms
  @JsonKey(name: 'synsets')
  List<SynonymSet>? synonymSet;

  /// The similar terms
  @JsonKey(name: 'similarterms')
  List<SimilarTerm>? similarTerms;

  /// The substring terms
  @JsonKey(name: 'substringterms')
  List<Term>? subStringTerms;

  /// The base forms
  @JsonKey(name: 'baseforms')
  List<String>? baseForms;
}

/// Class that represents a similar terms json object
@JsonSerializable(createToJson: false)
class SimilarTerms {
  factory SimilarTerms.fromJson(Map<String, dynamic> json) =>
      _$SimilarTermsFromJson(json);

  SimilarTerms();

  /// The similar terms
  @JsonKey(name: 'similarterms')
  List<SimilarTerm>? similarTerms;
}

/// Json representation of a set of synonyms.
@JsonSerializable(createToJson: false)
class SynonymSet {
  static List<SynonymTerm>? _flatten(List<dynamic>? json) {
    if (json == null || json.isEmpty) {
      return null;
    }
    return json
        .expand((element) => element)
        .map((entry) => SynonymTerm.fromJson(entry))
        .toList();
  }

  factory SynonymSet.fromJson(Map<String, dynamic> json) =>
      _$SynonymSetFromJson(json);

  SynonymSet();

  int? id;

  /// The categories
  List<String>? categories;

  /// The synonym terms
  List<SynonymTerm>? terms;

  /// The generic terms
  @JsonKey(name: 'supersynsets', fromJson: _flatten)
  List<SynonymTerm>? superSet;

  /// The specific terms
  @JsonKey(name: 'subsynsets', fromJson: _flatten)
  List<SynonymTerm>? subSet;
}
