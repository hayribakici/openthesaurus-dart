part of openthesaurus.models;

@JsonSerializable(createToJson: false)
class OpenThesaurusResponse {

  factory OpenThesaurusResponse.fromJson(Map<String, dynamic> json) => _$OpenThesaurusResponseFromJson(json);

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

  factory SimilarTerms.fromJson(Map<String, dynamic> json) => _$SimilarTermsFromJson(json);
  
  SimilarTerms();

  @JsonKey(name: 'similarterms')
  List<SimilarTerm>? similarTerms;
}

@JsonSerializable(createToJson: false)
class SynonymSet {
  factory SynonymSet.fromJson(Map<String, dynamic> json) => _$SynonymSetFromJson(json);

  SynonymSet();

  List<String>? categories;

  List<SynonymTerm>? terms;
}


