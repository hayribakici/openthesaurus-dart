// GENERATED CODE - DO NOT MODIFY BY HAND

part of '_models.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

OpenThesaurusResponse _$OpenThesaurusResponseFromJson(
        Map<String, dynamic> json) =>
    OpenThesaurusResponse()
      ..synonymSet = (json['synsets'] as List<dynamic>?)
          ?.map((e) => SynonymSet.fromJson(e as Map<String, dynamic>))
          .toList()
      ..similarTerms = (json['similarterms'] as List<dynamic>?)
          ?.map((e) => SimilarTerm.fromJson(e as Map<String, dynamic>))
          .toList()
      ..subStringTerms = (json['substringterms'] as List<dynamic>?)
          ?.map((e) => Term.fromJson(e as Map<String, dynamic>))
          .toList()
      ..baseForms = (json['baseforms'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList();

SimilarTerms _$SimilarTermsFromJson(Map<String, dynamic> json) => SimilarTerms()
  ..similarTerms = (json['similarterms'] as List<dynamic>?)
      ?.map((e) => SimilarTerm.fromJson(e as Map<String, dynamic>))
      .toList();

SynonymSet _$SynonymSetFromJson(Map<String, dynamic> json) => SynonymSet()
  ..categories =
      (json['categories'] as List<dynamic>?)?.map((e) => e as String).toList()
  ..terms = (json['terms'] as List<dynamic>?)
      ?.map((e) => SynonymTerm.fromJson(e as Map<String, dynamic>))
      .toList();

Term _$TermFromJson(Map<String, dynamic> json) =>
    Term()..term = json['term'] as String?;

SimilarTerm _$SimilarTermFromJson(Map<String, dynamic> json) => SimilarTerm()
  ..term = json['term'] as String?
  ..distance = json['distance'] as int?;

SynonymTerm _$SynonymTermFromJson(Map<String, dynamic> json) => SynonymTerm()
  ..term = json['term'] as String?
  ..level = SynonymTerm._levelFromJson(json['level'] as String?);