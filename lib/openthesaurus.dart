// Copyright (c) 2023, hayribakici. All rights reserved. Use of this source code
// is governed by a BSD-style license that can be found in the LICENSE file.

/// A dart library for interfacing with the API of openthesaurus.de.
library openthesaurus;

import 'src/models/_models.dart';
import 'package:http/http.dart' as http;

import 'dart:convert';

export 'src/models/_models.dart';

import 'package:openthesaurus/openthesaurus.dart';

part 'src/openthesaurus_api.dart';

class OpenThesaurus {
  factory OpenThesaurus.create() => OpenThesaurus(OpenThesaurusApi());

  final OpenThesaurusApi _api;

  OpenThesaurus(this._api);

  Future<List<SynonymSet>> get(String query) async {
    assert(query.isNotEmpty, 'Search query cannot be empty');
    return (await getWith(query)).synonymSet ?? [];
  }

  Future<OpenThesaurusResponse> getWith(String query,
      {bool similar = false,
      bool startsWith = false,
      bool superSet = false,
      bool subSet = false,
      bool baseForm = false}) async {
    assert(query.isNotEmpty, 'Search query cannot be empty');
    return await _api._get({
      'q': query,
      'similar': similar,
      'startswith': startsWith,
      'supersynsets': superSet,
      'subsynsets': subSet,
      'baseform': baseForm,
    });
  }

  Future<OpenThesaurusResponse> withSubString(String query,
      {bool similar = false,
      bool startsWith = false,
      bool superSet = false,
      bool subSet = false,
      bool baseForm = false,
      int from = 0,
      int max = 10}) async {
    assert(query.isNotEmpty, 'Search query cannot be empty');
    assert(from >= 0, 'Parameter \'from\' cannot be < 0');
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
