// Copyright (c) 2023, hayribakici. All rights reserved. Use of this source code
// is governed by a BSD-style license that can be found in the LICENSE file.

/// A dart library for interfacing with the API of openthesaurus.de.
import 'package:openthesaurus/openthesaurus.dart';

void main(List<String> args) async {
  var ot = OpenThesaurus.create();
  var response = await ot.get('Hand');
  for (var syn in response) {
    print(syn.terms?.map((e) => e.term).toList());
  }
}
