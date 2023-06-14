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
    expect(first.categories, isEmpty);
    expect(first.terms, isNotEmpty);
    expect(first.terms?[0].term, "Hand");
    expect(first.terms?[2].level, Level.colloquial);
  });
}
