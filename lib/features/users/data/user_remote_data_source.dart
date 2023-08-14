import 'package:app/core/config.dart';
import 'package:app/features/users/data/user_model.dart';
import 'package:app/features/users/domain/entities/user_entity.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

abstract class UserRemoteDataSource {
  Future<List<UserEntity>?> getUsers();
}

class UserRemoteDataSourceImplementation implements UserRemoteDataSource {
  final http.Client client;
  final Config config;

  UserRemoteDataSourceImplementation({
    required this.client,
    required this.config,
  });

  @override
  Future<List<UserEntity>?> getUsers() async {
    try {
      final response = await client.get(
        config.apiUri,
        headers: {
          'Content-Type': 'application/json',
        },
      );
      if (response.statusCode == 200) {
        List<dynamic> usersList = json.decode(response.body);
        // Randomize the list as per the requirement
        usersList.shuffle();
        return usersList
            .map((userItem) => UserModel.fromMap(userItem))
            .toList();
      } else {
        return null;
      }
    } catch (error, _) {
      // In a production environment we could log the error and stacktrace;
      return null;
    }
  }
}
