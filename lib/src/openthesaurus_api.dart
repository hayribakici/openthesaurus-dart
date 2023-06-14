part of openthesaurus;

class OpenThesaurusApi {
  static const String _authority = 'www.openthesaurus.de';

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

class ApiRequestExceededError extends Error {}
