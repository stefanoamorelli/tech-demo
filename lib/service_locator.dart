// coverage:ignore-file
import 'package:app/features/users/data/user_remote_data_source.dart';
import 'package:app/features/users/domain/repositories/user_repository.dart';
import 'package:app/features/users/presentation/cubit/user_cubit.dart';
import 'package:get_it/get_it.dart';
import 'package:app/core/config.dart';
import 'package:http/http.dart' as http;

final serviceLocator = GetIt.instance;

Future<void> init() async {
  serviceLocator.registerLazySingleton<Config>(
    (() => Config.getDefaultConfig()),
  );

  serviceLocator.registerFactory(
    () => UserCubit(
      userRepository: serviceLocator(),
    )..init(),
  );

  serviceLocator.registerLazySingleton<UserRepository>(
    () => UserRepositoryImplementation(
      userRemoteDataSource: serviceLocator(),
    ),
  );

  serviceLocator.registerLazySingleton<UserRemoteDataSource>(
    () => UserRemoteDataSourceImplementation(
      client: serviceLocator(),
      config: serviceLocator(),
    ),
  );

  serviceLocator.registerLazySingleton(() => http.Client());
}
