import 'package:app/features/users/domain/entities/user_entity.dart';
import 'package:app/features/users/presentation/cubit/user_cubit.dart';
import 'package:app/features/users/presentation/cubit/user_state.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:app/service_locator.dart';

class UserScreen extends StatelessWidget {
  UserScreen({Key? key}) : super(key: key);

  @visibleForTesting
  final GlobalKey<AnimatedListState> listKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return BlocProvider<UserCubit>(
      create: (context) => serviceLocator<UserCubit>(),
      child: BlocBuilder<UserCubit, UserState>(
        builder: (context, state) {
          return Scaffold(
            body: SafeArea(
              child: _buildBody(context, state),
            ),
          );
        },
      ),
    );
  }

  Widget _buildBody(BuildContext context, UserState state) {
    if (state.isLoading) {
      return const Center(
        child: CupertinoActivityIndicator(),
      );
    }
    if (state.errorMessage != null) {
      return Center(
        child: Text(
          state.errorMessage ?? "Error.",
          textAlign: TextAlign.center,
        ),
      );
    }
    if (state.users.isEmpty) {
      return const Center(
        child: Text("No users found"),
      );
    }
    return ListView(
      children: state.users.map((user) {
        return ListTile(
          title: Text(user.name),
          subtitle: Text("${user.email} - ${user.company['name'] ?? 'n/a'}"),
          onTap: () {
            _showDetails(
              context,
              user,
            );
          },
        );
      }).toList(),
    );
  }

  Future<void> _showDetails(
    BuildContext context,
    UserEntity user,
  ) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(user.name),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text('Username: ${user.username}'),
                const Divider(),
                Text('Email: ${user.email}'),
                const Divider(),
                Text('Address street: ${user.address['street'] ?? 'n/a'}'),
                const Divider(),
                Text('Address suite: ${user.address['suite'] ?? 'n/a'}'),
                const Divider(),
                Text('City: ${user.address['city'] ?? 'n/a'}'),
                const Divider(),
                Text('ZIP: ${user.address['zipcode'] ?? 'n/a'}'),
                const Divider(),
                Text('Phone: ${user.phone}'),
                const Divider(),
                Text('Website: ${user.website}'),
                const Divider(),
                Text('Company name: ${user.company['name'] ?? 'n/a'}'),
                const Divider(),
                Text('Company slogan: ${user.company['catchPhrase'] ?? 'n/a'}'),
                const Divider(),
                Text('Company keywords: ${user.company['bs'] ?? 'n/a'}'),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('Ok'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}
