import 'package:app/features/users/domain/entities/user_entity.dart';
import 'package:equatable/equatable.dart';

class UserState extends Equatable {
  final List<UserEntity> users;
  final bool isLoading;
  final String? errorMessage;

  const UserState(
    this.users, {
    this.isLoading = false,
    this.errorMessage,
  });

  UserState copyWith({
    List<UserEntity>? users,
    bool? isLoading,
    String? Function()? errorMessage,
    bool? refresh,
  }) {
    return UserState(
      users ?? this.users,
      isLoading: isLoading ?? this.isLoading,
      errorMessage: errorMessage != null ? errorMessage() : this.errorMessage,
    );
  }

  @override
  List<Object?> get props => [
        users,
        isLoading,
        errorMessage,
      ];
}
