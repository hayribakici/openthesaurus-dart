// Copyright (c) 2023, hayribakici. All rights reserved. Use of this source code
// is governed by a BSD-style license that can be found in the LICENSE file.

import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:openthesaurus/openthesaurus.dart';

/// Mock class for making requests
class OpenThesaurusMock extends OpenThesaurus {
  OpenThesaurusMock() : super(OpenThesaurusApiMock());
}

class OpenThesaurusApiMock extends OpenThesaurusApi {
  @override
  Future<http.Response> httpget(url, {Map<String, String>? headers}) async =>
      createSuccessResponse(_readResponse());

  http.Response createSuccessResponse(String body) {
    /// necessary due to using Latin-1 encoding per default.
    /// https://stackoverflow.com/questions/52990816/dart-json-encodedata-can-not-accept-other-language
    return http.Response(body, 200, headers: {
      HttpHeaders.contentTypeHeader: 'application/json; charset=utf-8'
    });
  }

  String _readResponse() {
    var file = File('test/data/response.json');
    return file.readAsStringSync();
  }
}
