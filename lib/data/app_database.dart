import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

import '../models/app_user.dart';
import 'sqlite_factory_stub.dart'
    if (dart.library.io) 'sqlite_factory_io.dart';

/// Local SQLite database for the training app (users now; donations in part 3).
class AppDatabase {
  AppDatabase._();
  static final AppDatabase instance = AppDatabase._();

  static const _dbName = 'ikram_charity.db';
  static const _version = 1;

  Database? _db;

  Future<Database> get database async {
    if (_db != null) return _db!;
    configureSqliteFactory();
    _db = await _open();
    return _db!;
  }

  Future<Database> _open() async {
    final path = await _dbPath();
    return openDatabase(
      path,
      version: _version,
      onCreate: (db, version) async {
        // Passwords are stored as plain text for training only.
        await db.execute('''
CREATE TABLE users (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  name TEXT NOT NULL,
  email TEXT NOT NULL UNIQUE,
  phone TEXT,
  password TEXT NOT NULL,
  created_at TEXT NOT NULL
)
''');
        await _seedUsers(db);
      },
    );
  }

  Future<String> _dbPath() async {
    if (isDesktopSqlite) {
      final dir = await getApplicationDocumentsDirectory();
      return p.join(dir.path, _dbName);
    }
    return p.join(await getDatabasesPath(), _dbName);
  }

  Future<void> _seedUsers(Database db) async {
    final now = DateTime.now().toIso8601String();
    await db.insert('users', {
      'name': 'متبرع تجريبي',
      'email': DemoAccounts.demoEmail,
      'phone': '0536060603',
      'password': DemoAccounts.password,
      'created_at': now,
    });
    await db.insert('users', {
      'name': 'متبرع إكرام',
      'email': DemoAccounts.donorEmail,
      'phone': '0555299319',
      'password': DemoAccounts.password,
      'created_at': now,
    });
  }
}
