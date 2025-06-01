import 'package:flutter_bloc/flutter_bloc.dart';
import '../../models/user.dart'; // Add this import
import '../../services/api_service.dart';
import 'user_event.dart';
import 'user_state.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  final ApiService apiService;
  int skip = 0;
  final int limit = 10;

  UserBloc({required this.apiService}) : super(UserInitial()) {
    on<FetchUsers>(_onFetchUsers);
    on<SearchUsers>(_onSearchUsers);
    on<LoadMoreUsers>(_onLoadMoreUsers);
  }

  Future<void> _onFetchUsers(FetchUsers event, Emitter<UserState> emit) async {
    try {
      emit(UserLoading());
      final result = await apiService.getUsers(limit: limit, skip: skip);
      final List<User> users = (result['users'] as List)
          .map((user) => User.fromJson(user as Map<String, dynamic>))
          .toList();
      emit(UserLoaded(users: users, hasReachedMax: users.length < limit));
    } catch (e) {
      emit(UserError(e.toString()));
    }
  }

  Future<void> _onSearchUsers(
      SearchUsers event, Emitter<UserState> emit) async {
    try {
      emit(UserLoading());
      final result = await apiService.getUsers(
        limit: limit,
        skip: 0,
        search: event.query,
      );
      final List<User> users = (result['users'] as List)
          .map((user) => User.fromJson(user as Map<String, dynamic>))
          .toList();
      emit(UserLoaded(users: users, hasReachedMax: true));
    } catch (e) {
      emit(UserError(e.toString()));
    }
  }

  Future<void> _onLoadMoreUsers(
      LoadMoreUsers event, Emitter<UserState> emit) async {
    if (state is UserLoaded) {
      final currentState = state as UserLoaded;
      if (!currentState.hasReachedMax) {
        try {
          skip += limit;
          final result = await apiService.getUsers(limit: limit, skip: skip);
          final List<User> newUsers = (result['users'] as List)
              .map((user) => User.fromJson(user as Map<String, dynamic>))
              .toList();
          emit(UserLoaded(
            users: [...currentState.users, ...newUsers],
            hasReachedMax: newUsers.length < limit,
          ));
        } catch (e) {
          emit(UserError(e.toString()));
        }
      }
    }
  }
}
