// Copyright (c) 2023, hayribakici. All rights reserved. Use of this source code
// is governed by a BSD-style license that can be found in the LICENSE file.

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
  factory SynonymTerm.fromJson(Map<String, dynamic> json) =>
      _$SynonymTermFromJson(json);

  SynonymTerm();

  /// Level of term usage. Can be [Level.colloquial],
  /// [Level.exalted], [Level.rough] or a [Level.technical] term.
  Level? level;
}

/// Level of usage of the word.
@JsonEnum(valueField: 'key')
enum Level {
  /// A colloquial term
  colloquial(key: 'umgangssprachlich', abbr: 'ugs.'),

  /// A technical term
  technical(key: 'fachsprachlich', abbr: 'fachspr.'),

  /// A rough term
  rough(key: 'derb', abbr: 'derb'),

  /// An exalted term
  exalted(key: 'gehoben', abbr: 'geh.'),

  // A figurative term
  figurative(key: 'figurativ', abbr: 'fig.');

  const Level({required this.key, required this.abbr});

  /// The value from the json response
  final String key;

  /// The abbriviation of the level. Used for output
  final String abbr;
}
