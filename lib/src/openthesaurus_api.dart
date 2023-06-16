// Copyright (c) 2023, hayribakici. All rights reserved. Use of this source code
// is governed by a BSD-style license that can be found in the LICENSE file.

/// A dart library for interfacing with the API of openthesaurus.de.
part of openthesaurus;

/// Class for calling the openthesaurus.de API
class OpenThesaurusApi {
  static const String _authority = 'www.openthesaurus.de';

  /// Retrieve a synonyme based on the given [query].
  Future<OpenThesaurusResponse> _get(Map<String, dynamic> query) async {
    query.addAll({'format': 'application/json'});
    var response = await _getImpl(_authority, query, {
      'User-Agent': 'https://github.com/hayribakici/openthesaurus-dart',
    });
    return OpenThesaurusResponse.fromJson(jsonDecode((response)));
  }

  Future<String> _getImpl(String url, Map<String, dynamic> query,
      Map<String, String> headers) async {
    var uri = Uri.https(url, 'synonyme/search',
        query.map((key, value) => MapEntry(key, value.toString())));
    return await _requestWrapper(
        () async => await httpget(uri, headers: headers));
  }

  String handleErrors(http.Response response) {
    final responseBody = utf8.decode(response.bodyBytes);
    if (response.statusCode >= 400) {
      if (response.statusCode == 429) {
        throw ApiRequestExceededError();
      }
      throw Exception();
    }
    return responseBody;
  }

  Future<String> _requestWrapper(
      Future<http.Response> Function() request) async {
    try {
      return handleErrors(await request());
    } catch (ex) {
      return Future.error(ex);
    }
  }

  Future<http.Response> httpget(Uri url, {Map<String, String>? headers}) =>
      http.get(url, headers: headers);
}

/// Custom error class when the requests exceeds `>=60` requests/min.
class ApiRequestExceededError extends Error {}
