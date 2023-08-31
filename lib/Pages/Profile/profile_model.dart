class ProfileModel {
  final String? id;
  final String firstName;
  final String lastName;
  final String department;
  final String email;

  ProfileModel({
    this.id,
    required this.firstName,
    required this.lastName,
    required this.department,
    required this.email,
  });

  factory ProfileModel.fromJson(Map<String, dynamic> json) {
    return ProfileModel(
      id: json['id'],
      firstName: json['firstName'],
      lastName: json['lastName'],
      department: json['department'],
      email: json['email'],
    );
  }
}
