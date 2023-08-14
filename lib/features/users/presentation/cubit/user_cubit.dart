import 'dart:async';

import 'package:app/features/users/domain/entities/user_entity.dart';
import 'package:app/features/users/domain/repositories/user_repository.dart';
import 'package:app/features/users/presentation/cubit/user_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UserCubit extends Cubit<UserState> {
  final UserRepository userRepository;

  UserCubit({
    required this.userRepository,
  }) : super(const UserState([]));

  Future<void> init() async {
    emit(state.copyWith(isLoading: true));
    List<UserEntity>? users = await userRepository.users;
    if (users == null) {
      emit(
        state.copyWith(
          users: [],
          isLoading: false,
          errorMessage: () => "Error while fetching users, please try again",
        ),
      );
    } else {
      emit(
        state.copyWith(
          users: users,
          isLoading: false,
        ),
      );
    }
  }
}
