import 'package:app/features/users/data/user_remote_data_source.dart';

import '../entities/user_entity.dart';

abstract class UserRepository {
  Future<List<UserEntity>?> get users;
}

class UserRepositoryImplementation implements UserRepository {
  final UserRemoteDataSource userRemoteDataSource;

  UserRepositoryImplementation({
    required this.userRemoteDataSource,
  });

  @override
  Future<List<UserEntity>?> get users async =>
      await userRemoteDataSource.getUsers();
}
