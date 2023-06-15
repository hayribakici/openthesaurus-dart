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

  test('getWithSimilarTerms', () async {
    var response = await openthesaurus.getWith('query');
    expect(response, isNotNull);
    expect(response.similarTerms, isNotNull);
    expect(response.similarTerms, isNotEmpty);

    var similar = response.similarTerms;
    expect(similar!.first, isNotNull);
    expect(similar.first.term, 'Hand (Fußball)');
    expect(similar.first.distance, 0);
  });
}
