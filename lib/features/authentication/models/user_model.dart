class UserModel {
  final String firstName;
  final String lastName;
  final String username;
  final String gender;
  final DateTime birthDate;
  final String email;

  UserModel({
    required this.firstName,
    required this.lastName,
    required this.username,
    required this.gender,
    required this.birthDate,
    required this.email,
  });

  Map<String, dynamic> toJson() {
    return {
      'firstName': firstName,
      'lastName': lastName,
      'username': username,
      'gender': gender,
      'birthDate': birthDate.toIso8601String(),
      'email': email,
    };
  }

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      firstName: json['firstName'],
      lastName: json['lastName'],
      username: json['username'],
      gender: json['gender'],
      birthDate: DateTime.parse(json['birthDate']),
      email: json['email'],
    );
  }
}
