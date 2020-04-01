// Copyright (c) 2020, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

// Requirements=nnbd-weak

// Verify that member signatures are computed correctly for null-safe
// classes having both a legacy and a null-safe superinterface, and with some
// classes also overriding declarations in the class itself. The expected
// member signatures are indicated in comments on each class in the library
// 'legacy_resolves_conflict_3_lib2.dart'. This test uses assignability to
// confirm that the return type of the getter `a` is assignable to the
// expected type; 'legacy_resolves_conflict_3_error_test.dart' complements
// this by ascertaining that said return type is not legacy.

import 'package:expect/expect.dart';
import 'legacy_resolves_conflict_3_lib.dart';
import 'legacy_resolves_conflict_3_lib2.dart';

void main() {
  // Ensure that no class is eliminated by tree-shaking.
  Expect.isNotNull([
    DiB0, DiBq0, DwB0, DwBq0, DiBO0, DiBqO0, DiBOq0, DiBqOq0, DiB1, DiBq1, //
    DwB1, DwBq1, DiBO1, DiBqO1, DiBOq1, DiBqOq1, DiB2, DiBq2, DwB2, DwBq2, //
    DiBO2, DiBqO2, DiBOq2, DiBqOq2, DiB3, DiBq3, DwB3, DwBq3, DiBO3, DiBqO3, //
    DiBOq3, DiBqOq3, DiB4, DiBq4, DwB4, DwBq4, DiBO4, DiBqO4, DiBOq4, //
    DiBqOq4, DiB5, DiBq5, DwB5, DwBq5, DiBO5, DiBqO5, DiBOq5, DiBqOq5, //
  ]);

  // Verify that some classes have a signature as in `B`.
  List<List<int Function(int)>> xsB = [
    DwB0().a, DiBO0().a, DiBqO0().a, DwB1().a, DiBO1().a, //
    DiBqO1().a, DwB2().a, DiBO2().a, DiBqO2().a, DwB3().a, //
    DiBO3().a, DiBqO3().a, DwB4().a, DiBO4().a, DiBqO4().a, //
    DwB5().a, DiBO5().a, DiBqO5().a, //
  ];

  // Verify that some classes have a signature as in `Bq`.
  List<List<int? Function(int?)>> xsBq = [
    DwBq0().a, DiBOq0().a, DiBqOq0().a, DwBq1().a, DiBOq1().a, //
    DiBqOq1().a, DwBq2().a, DiBOq2().a, DiBqOq2().a, DwBq3().a, //
    DiBOq3().a, DiBqOq3().a, DwBq4().a, DiBOq4().a, DiBqOq4().a, //
    DwBq5().a, DiBOq5().a, DiBqOq5().a, //
  ];

  // Verify that some classes have a legacy signature.
  List<List<int Function(int)>> xsLegacy = [
    DiB0().a, DiBq0().a, DiB1().a, DiBq1().a, //
    DiB3().a, DiBq3().a, DiB4().a, DiBq4().a, //
  ];
  List<List<int? Function(int?)>> xsLegacyQ = [
    DiB0().a, DiBq0().a, DiB1().a, DiBq1().a, //
    DiB3().a, DiBq3().a, DiB4().a, DiBq4().a, //
  ];

  void testAbstractClasses(DiB2 diB2, DiBq2 diBq2, DiB5 diB5, DiBq5 diBq5) {
    List<List<int Function(int)>> xsLegacy = [diB2.a, diBq2.a, diB5.a, diBq5.a];
    List<List<int? Function(int?)>> xsLegacyQ = [
      diB2.a, diBq2.a, diB5.a, diBq5.a, //
    ];
    print("$xsLegacy, $xsLegacyQ");
  }
}
