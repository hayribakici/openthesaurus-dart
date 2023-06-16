// Copyright (c) 2023, hayribakici. All rights reserved. Use of this source code
// is governed by a BSD-style license that can be found in the LICENSE file.

import 'package:openthesaurus/openthesaurus.dart';
import 'package:test/test.dart';

import 'openthesaurus_mock.dart';

void main() {
  var openthesaurus = OpenThesaurusMock();
  test('getSynonyme', () async {
    var response = await openthesaurus.get('query');
    expect(response, isNotNull);
    expect(response.length, 3);

    var first = response.first;
    expect(first.categories, isNotEmpty);
    expect(first.categories!.first, "Körper");
    expect(first.terms, isNotEmpty);
    expect(first.terms?[0].term, "Hand");
    expect(first.terms?[2].level, Level.colloquial);
    expect(first.terms?.last.level, Level.rough);

    expect(first.superSet?.first.term, "Anstalt");
  });

  test('getall', () async {
    var response = await openthesaurus.getWith('query');
    expect(response, isNotNull);
    expect(response.similarTerms, isNotNull);
    expect(response.similarTerms, isNotEmpty);
    expect(response.startsWithTerms, isNotEmpty);

    var similar = response.similarTerms;
    expect(similar!.first, isNotNull);
    expect(similar.first.term, 'Hand (Fußball)');
    expect(similar.first.distance, 0);

    var base = response.baseForms;
    expect(base, isNotNull);
    expect(base, isNotEmpty);
    expect(base?.first, "Hand");
  });
}
