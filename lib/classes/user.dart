class User {
  final int id;
  final String name;
  final String email;
  final String password;

  const User(
      {required this.id,
      required this.name,
      required this.email,
      required this.password});

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      name: json['name'] as String,
      id: json['id'] as int,
      email: json['email'] as String,
      password: json['password'] as String,
    );
  }
}
