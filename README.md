# Openthesaurus-dart

This is a simple dart library for accessing the [openthesaurus](https://www.openthesaurus.de) api.

## Usage

```dart
import 'package:openthesaurus/openthesaurus.dart';

void main(List<String> args) async {
  var ot = OpenThesaurus.create();
  var synonyms = await ot.get('Hand');
  for (var syn in synonyms) {
    print(syn.terms?.map((e) => e.term).toList());
  }
}
```
