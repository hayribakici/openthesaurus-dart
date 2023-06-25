# openthesaurus-dart

This is a simple dart library for accessing the [openthesaurus](https://www.openthesaurus.de) api.

## Get it through [pub.dev](https://pub.dev/packages/openthesaurus)

```yaml
...
dependencies:
  openthesaurus: <latest_version>
```

or

```
dart pub add openthesaurus
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
var response = ot.getWith('Hand', 
  similar: true,     // return similar terms
  startsWith: true,  // return terms that start with the query
  superSet: true,    // return generic terms
  subSet: true,      // return specific terms
  baseForm: true     // return base form of query term
);

var synonyms = response.synonymSet;
...
var similar = response.similarTerms;
...
var startsWithTerms = response.startsWithTerms;
...
var baseForms = responce.baseForms;
```

or more specifically 

```dart
var response = ot.getWithSubString('Hand', 
  similar: true,     // return similar terms
  startsWith: true,  // return terms that start with the query
  superSet: true,    // return generic terms
  subSet: true,      // return specific terms
  baseForm: true     // return base form of query term
  from: 0,           // index of the substring to start
  max: 10            // maximum number of substring results
);

```

See the [pub.dev API documentation](https://pub.dev/documentation/openthesaurus/latest/openthesaurus/openthesaurus-library.html) for description of the parameters and return types.
