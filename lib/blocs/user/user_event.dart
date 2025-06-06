import 'package:equatable/equatable.dart';

abstract class UserEvent extends Equatable {
  const UserEvent();

  @override
  List<Object?> get props => [];
}

class FetchUsers extends UserEvent {
  const FetchUsers();
}

class SearchUsers extends UserEvent {
  final String query;
  const SearchUsers(this.query);

  @override
  List<Object?> get props => [query];
}

class LoadMoreUsers extends UserEvent {
  const LoadMoreUsers();
}
