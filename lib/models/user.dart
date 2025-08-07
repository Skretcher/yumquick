class User {
  final String id;
  final String name;
  final String email;
  final String token;
  final String? mobile;
  final String? dob;

  User({
    required this.id,
    required this.name,
    required this.email,
    required this.token,
    this.mobile,
    this.dob,
  });

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'email': email,
        'token': token,
        'mobile': mobile,
        'dob': dob,
      };

  factory User.fromJson(Map<String, dynamic> json) => User(
        id: json['id'],
        name: json['name'],
        email: json['email'],
        token: json['token'],
        mobile: json['mobile'],
        dob: json['dob'],
      );
}
