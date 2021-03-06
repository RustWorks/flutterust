/// bindings for `libaddr`

import 'dart:ffi';
import 'package:ffi/ffi.dart' as ffi;
import 'dart:io';

// ignore_for_file: unused_import, camel_case_types, non_constant_identifier_names
final DynamicLibrary _dl = _open();
DynamicLibrary _open() {
  if (Platform.isAndroid) return DynamicLibrary.open('libadder_ffi.so');
  if (Platform.isIOS) return DynamicLibrary.executable();
  throw UnsupportedError('This platform is not supported.');
}

/// C function `add`.
int add(
  int a,
  int b,
) {
  return _add(a, b);
}
final _add_Dart _add = _dl.lookupFunction<_add_C, _add_Dart>('add');
typedef _add_C = Int64 Function(
  Int64 a,
  Int64 b,
);
typedef _add_Dart = int Function(
  int a,
  int b,
);
