// Copyright (c) 2023, hayribakici. All rights reserved. Use of this source code
// is governed by a BSD-style license that can be found in the LICENSE file.

library openthesaurus;

import 'src/models/_models.dart';
import 'package:http/http.dart' as http;

import 'dart:convert';

export 'src/models/_models.dart';

import 'package:openthesaurus/openthesaurus.dart';

part 'src/openthesaurus_api.dart';

class OpenThesaurus {
  /// Creates an instance of this class for requesting synonyms.
  factory OpenThesaurus.create() => OpenThesaurus(OpenThesaurusApi());

  final OpenThesaurusApi _api;

  OpenThesaurus(this._api);

  /// Retrieve a collection of synonyms based on the given [query]
  Future<List<SynonymSet>> get(String query) async =>
      (await _getWith(query)).synonymSet ?? [];

  /// Retrieve a collection of synonyms based on the given [query] and
  /// with the following options. Retrieve ...
  ///
  /// * [similar] terms
  /// * terms that [startsWith] the same letters as the [query]
  /// * [superSet] terms, that are more generic
  /// * [subSet] terms, that are more specific
  /// * the [baseForm] of the [query]
  Future<OpenThesaurusResponse> getWith(String query,
          {bool similar = false,
          bool startsWith = false,
          bool superSet = false,
          bool subSet = false,
          bool baseForm = false}) async =>
      await _getWith(query,
          similar: similar,
          startsWith: startsWith,
          superSet: superSet,
          subSet: subSet,
          baseForm: baseForm,
          subString: false,
          from: 0,
          max: 10);

  /// Retrieve a collection of synonyms based on the given [query] and
  /// with the following options. Retrieve ...
  ///
  /// * [similar] terms
  /// * terms that [startsWith] the same letters as the [query]
  /// * [superSet] terms, that are more generic
  /// * [subSet] terms, that are more specific
  /// * the [baseForm] of the [query]
  /// * terms that contain the substring of the [query], starting [from]
  /// a position
  /// * a [max] number of substring results
  Future<OpenThesaurusResponse> getWithSubString(String query,
          {bool similar = false,
          bool startsWith = false,
          bool superSet = false,
          bool subSet = false,
          bool baseForm = false,
          int from = 0,
          int max = 10}) async =>
      _getWith(query,
          similar: similar,
          startsWith: startsWith,
          superSet: superSet,
          subSet: subSet,
          baseForm: baseForm,
          subString: true,
          from: from,
          max: max);

  Future<OpenThesaurusResponse> _getWith(String query,
      {bool similar = false,
      bool startsWith = false,
      bool superSet = false,
      bool subSet = false,
      bool baseForm = false,
      bool subString = false,
      int from = 0,
      int max = 10}) async {
    assert(query.isNotEmpty, 'Search query cannot be empty');
    assert(from >= 0, 'Parameter \'from\' cannot be < 0');
    assert(max > 0, 'Parameter \'max\' cannot be <= 0');
    return await _api._get({
      'q': query,
      'similar': similar,
      'startswith': startsWith,
      'supersynsets': superSet,
      'subsynsets': subSet,
      'baseform': baseForm,
      'substring': true,
      'substringFromResults': from,
      'substringMaxResults': max,
    });
  }
}
