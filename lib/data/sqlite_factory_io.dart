import 'dart:io';

import 'package:sqflite_common_ffi/sqflite_ffi.dart';

void configureSqliteFactory() {
  if (Platform.isWindows || Platform.isLinux) {
    sqfliteFfiInit();
    databaseFactory = databaseFactoryFfi;
  }
}

bool get isDesktopSqlite => Platform.isWindows || Platform.isLinux;
