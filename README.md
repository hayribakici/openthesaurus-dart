# openthesaurus-dart

This is a simple dart library for accessing the [openthesaurus](https://www.openthesaurus.de) api.

## Get it through [pub.dev](https://pub.dev/packages/openthesaurus)

```yaml
...
dependencies:
  openthesaurus: <latest_version>
```

## Usage

Create an instance with

```dart

import 'package:openthesaurus/openthesaurus.dart';

var ot = OpenThesaurus.create();
```

and retrieve synonyms with

```dart
var synonyms = await ot.get('Hand');
for (var syn in synonyms) {
  print(syn.terms?.map((e) => e.term).toList());
}
```

### Options

Retrieve synonyms with options with

```dart
var response = ot.getWith('Hand', similar: true,
  startsWith: true, 
  superSet: true, 
  subSet: true, 
  baseForm: true);
```

or

```dart
var response = ot.getWithSubString('Hand', similar: true,
  startsWith: true,
  superSet: true, 
  subSet: true, 
  baseForm: true,
  from: 0,
  max: 10);
```

See the [pub.dev API documentation](https://pub.dev/documentation/openthesaurus/latest/openthesaurus/openthesaurus-library.html) for description of the parameters.
