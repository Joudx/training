import '../models/app_user.dart';
import 'app_database.dart';

class DuplicateEmailException implements Exception {
  const DuplicateEmailException();
}

class UserRepository {
  UserRepository._();
  static final UserRepository instance = UserRepository._();

  Future<AppUser?> findById(int id) async {
    final db = await AppDatabase.instance.database;
    final rows = await db.query(
      'users',
      where: 'id = ?',
      whereArgs: [id],
      limit: 1,
    );
    if (rows.isEmpty) return null;
    return AppUser.fromMap(rows.first);
  }

  Future<AppUser?> findByEmail(String email) async {
    final db = await AppDatabase.instance.database;
    final rows = await db.query(
      'users',
      where: 'email = ?',
      whereArgs: [email.trim().toLowerCase()],
      limit: 1,
    );
    if (rows.isEmpty) return null;
    return AppUser.fromMap(rows.first);
  }

  Future<AppUser?> authenticate(String email, String password) async {
    final user = await findByEmail(email);
    if (user == null) return null;
    if (user.password != password) return null;
    return user;
  }

  Future<AppUser> register({
    required String name,
    required String email,
    required String password,
    String? phone,
  }) async {
    final normalized = email.trim().toLowerCase();
    final existing = await findByEmail(normalized);
    if (existing != null) {
      throw const DuplicateEmailException();
    }

    final db = await AppDatabase.instance.database;
    final id = await db.insert('users', {
      'name': name.trim(),
      'email': normalized,
      'phone': phone?.trim().isEmpty ?? true ? null : phone!.trim(),
      'password': password,
      'created_at': DateTime.now().toIso8601String(),
    });
    final created = await findById(id);
    return created!;
  }
}
