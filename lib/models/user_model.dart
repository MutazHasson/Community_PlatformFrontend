class User {
  final String token;
  final String email;

  User({
    required this.token,
    required this.email,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      token: json['token'],
      email: json['email'],
    );
  }
}