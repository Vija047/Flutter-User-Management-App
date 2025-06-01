import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../blocs/user/user_bloc.dart';
import '../blocs/user/user_state.dart';
import '../blocs/user/user_event.dart';

class UserListScreen extends StatelessWidget {
  const UserListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UserBloc, UserState>(
      builder: (context, state) {
        if (state is UserInitial || state is UserLoading) {
          return const Center(child: CircularProgressIndicator());
        } else if (state is UserLoaded) {
          return ListView.builder(
            itemCount: state.users.length + 1,
            itemBuilder: (context, index) {
              if (index == state.users.length) {
                return state.hasReachedMax
                    ? const SizedBox()
                    : Center(
                        child: ElevatedButton(
                          onPressed: () {
                            context.read<UserBloc>().add(LoadMoreUsers());
                          },
                          child: const Text("Load More"),
                        ),
                      );
              }
              final user = state.users[index];
              return ListTile(
                leading: CircleAvatar(
                  backgroundImage: NetworkImage(user.image),
                ),
                title: Text('${user.firstName} ${user.lastName}'),
                subtitle: Text(user.email),
                onTap: () => Navigator.pushNamed(
                  context,
                  '/user-detail',
                  arguments: user,
                ),
              );
            },
          );
        } else if (state is UserError) {
          return Center(child: Text(state.message));
        }
        return const SizedBox();
      },
    );
  }
}
