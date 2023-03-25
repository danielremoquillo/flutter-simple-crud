class Account {
  final int id;
  final String name;
  final String email;

  const Account({required this.id, required this.name, required this.email});

  factory Account.fromJson(Map<String, dynamic> json) {
    return Account(
      name: json['name'] as String,
      id: json['id'] as int,
      email: json['email'] as String,
    );
  }
}
