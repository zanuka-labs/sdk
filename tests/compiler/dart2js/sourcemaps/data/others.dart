// Copyright (c) 2017, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

// Test file for testing source mappings of various expression and statements.

main() {
  throwStatement();
  whileLoop(true);
  forLoop(false);
  forInLoop([1]);
  forInLoop([1, 2]);
  forInLoopEmpty([]);
  forInLoopNull(null);
  doLoop(true);
  stringInterpolation(0);
  stringInterpolation(null);
  boxing();
  captureTwice();
  var c = new Class();
  equals(c, 0);
  c.property1 = 1;
  c.property2 = 2;
  equals(c, null);
  c.captureTwice();
  equals2(c, null);
  equals2(c, c);
  switchStatement(1);
  switchStatement(0);
  switchStatementConst(const Const(0));
  switchStatementConst(const Const(1));
  isInt(null);
  isInt(0);
  isDouble(null);
  isDouble(0.5);
  isBool(null);
  isBool(true);
  isString(null);
  isString('');
  asString(0);
  asString('');
  isList([]);
  isList(null);
  isListOfString(<String>[]);
  isListOfString(<int>[]);
  tryCatch();
  tryOnCatch();
}

throwStatement() {
  throw 'foo';
}

whileLoop(local) {
  while (local) {
    print(local);
  }
}

forLoop(local) {
  for (; local;) {
    print(local);
  }
}

forInLoop(local) {
  for (var e in local) {
    print(e);
  }
}

forInLoopEmpty(local) {
  for (var e in local) {
    print(e);
  }
}

forInLoopNull(local) {
  for (var e in local) {
    print(e);
  }
}

doLoop(local) {
  do {
    print(local);
  } while (local);
}

stringInterpolation(a) {
  // TODO(johnniwinther): Handle interpolation of `a` itself.
  print('${a()}');
}

boxing() {
  var b = 0;
  () {
    b = 2;
  }();
  return b;
}

captureTwice() {
  var b = 0;
  () {
    return b + b;
  }();
  return b;
}

class Class {
  var property1;
  var property2;

  captureTwice() {
    return () {
      return property1 == property2;
    };
  }
}

equals(a, b) {
  return a.property1 == b;
}

equals2(a, b) {
  return b != null && a.property1 == b.property1 && a.property2 == b.property2;
}

switchStatement(a) {
  switch (a) {
    case 0:
      return 1;
    case 1:
      return 2;
    case 2:
      return 3;
  }
}

class Const {
  final int value;

  const Const(this.value);
}

switchStatementConst(a) {
  switch (a) {
    case const Const(0):
      return 1;
    case const Const(2):
      return 2;
    case const Const(2):
      return 3;
  }
}

isInt(e) {
  e = e is int;
  print(e);
  return e;
}

isDouble(e) {
  e = e is double;
  print(e);
  return e;
}

isBool(e) {
  e = e is bool;
  print(e);
  return e;
}

isString(e) {
  e = e is String;
  print(e);
  return e;
}

isList(e) {
  e = e is List;
  print(e);
  return e;
}

isListOfString(e) {
  e = e is List<String>;
  print(e);
  return e;
}

asString(e) {
  e = e as String;
  print(e);
  return e;
}

tryCatch() {
  try {
    throw '';
  } catch (e) {
    print(e);
  }
}

tryOnCatch() {
  try {
    throw '';
  } on String catch (e) {
    print(e);
  } on int catch (e) {
    print(e);
  }
}

unresolvedToplevel() {
  // ignore: undefined_function
  unresolved();
}

unresolvedType(e) {
  // ignore: type_test_with_undefined_name
  e is Unresolved;
}