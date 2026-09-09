class AppUser {
  final int id;
  final String name;
  final String email;
  final String? phone;
  /// Training-only: stored as plain text. Do not use this in production.
  final String password;
  final String createdAt;

  const AppUser({
    required this.id,
    required this.name,
    required this.email,
    required this.password,
    required this.createdAt,
    this.phone,
  });

  factory AppUser.fromMap(Map<String, Object?> map) {
    return AppUser(
      id: map['id'] as int,
      name: map['name'] as String,
      email: map['email'] as String,
      phone: map['phone'] as String?,
      password: map['password'] as String,
      createdAt: map['created_at'] as String,
    );
  }

  Map<String, Object?> toMap() {
    return {
      'id': id,
      'name': name,
      'email': email,
      'phone': phone,
      'password': password,
      'created_at': createdAt,
    };
  }

  AppUser copyWith({int? id, String? name, String? email, String? phone}) {
    return AppUser(
      id: id ?? this.id,
      name: name ?? this.name,
      email: email ?? this.email,
      phone: phone ?? this.phone,
      password: password,
      createdAt: createdAt,
    );
  }
}

class DemoAccounts {
  static const demoEmail = 'demo@ekram.org.sa';
  static const donorEmail = 'donor@ekram.org.sa';
  static const password = '123456';
}
