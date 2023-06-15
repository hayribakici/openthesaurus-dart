part of openthesaurus.models;

/// Json representation of the root
@JsonSerializable(createToJson: false)
class OpenThesaurusResponse {
  factory OpenThesaurusResponse.fromJson(Map<String, dynamic> json) =>
      _$OpenThesaurusResponseFromJson(json);

  OpenThesaurusResponse();

  @JsonKey(name: 'synsets')
  List<SynonymSet>? synonymSet;

  @JsonKey(name: 'similarterms')
  List<SimilarTerm>? similarTerms;

  @JsonKey(name: 'substringterms')
  List<Term>? subStringTerms;

  @JsonKey(name: 'baseforms')
  List<String>? baseForms;
}

@JsonSerializable(createToJson: false)
class SimilarTerms {
  factory SimilarTerms.fromJson(Map<String, dynamic> json) =>
      _$SimilarTermsFromJson(json);

  SimilarTerms();

  @JsonKey(name: 'similarterms')
  List<SimilarTerm>? similarTerms;
}

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

  List<String>? categories;

  List<SynonymTerm>? terms;

  @JsonKey(name: 'supersynsets', fromJson: _flatten)
  List<SynonymTerm>? superSet;

  @JsonKey(name: 'subsynsets', fromJson: _flatten)
  List<SynonymTerm>? subSet;
}
