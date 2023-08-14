import 'package:app/features/users/domain/entities/user_entity.dart';

class UserModel extends UserEntity {
  const UserModel({
    required int id,
    required String name,
    required String username,
    required String email,
    required Map<dynamic, dynamic> address,
    required String phone,
    required String website,
    required Map<dynamic, dynamic> company,
  }) : super(
          id: id,
          name: name,
          username: username,
          email: email,
          address: address,
          phone: phone,
          website: website,
          company: company,
        );
  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      id: map['id'] ?? "",
      name: map['name'] ?? "",
      username: map['username'] ?? "",
      email: map['email'] ?? "",
      address: map['address'] ?? {},
      phone: map['phone'] ?? "",
      website: map['website'] ?? "",
      company: map['company'] ?? {},
    );
  }
}
