# Flutter User Management App

A comprehensive Flutter application for user management using BLoC pattern, REST API integration, and clean architecture.

## Project Goals

- Implement user management system using DummyJSON API
- Demonstrate BLoC pattern implementation
- Show clean architecture practices
- Handle complex state management
- Implement infinite scrolling and search functionality

## Features

- [x] User listing with infinite scroll
- [x] Real-time user search
- [x] User details with posts and todos
- [x] Create new posts (local)
- [x] Material Design 3 UI
- [x] Drawer navigation
- [x] Tab-based interface
- [x] Statistics dashboard
- [x] Settings page

## Project Structure

```
lib/
├── blocs/
│   └── user/
│       ├── user_bloc.dart
│       ├── user_event.dart
│       └── user_state.dart
├── models/
│   └── user.dart
├── screens/
│   ├── home_screen.dart
│   ├── search_users_screen.dart
│   ├── user_detail_screen.dart
│   ├── user_list_screen.dart
│   └── welcome_screen.dart
├── services/
│   └── api_service.dart
└── main.dart
```

## Setup Instructions

1. Clone the repository
```bash
git clone [repository-url]
cd flutter_user_management_app
```

2. Get dependencies
```bash
flutter pub get
```

3. Run the app
```bash
flutter run
```

## Architecture

The app follows a clean architecture pattern with:

- **BLoC Pattern**: For state management
- **Repository Pattern**: For data handling
- **Service Layer**: For API communication
- **Clean Code**: Following Flutter/Dart best practices

## API Integration

The app uses the DummyJSON API:
- Users API: https://dummyjson.com/users
- Posts API: https://dummyjson.com/posts/user/{userId}
- Todos API: https://dummyjson.com/todos/user/{userId}

## Dependencies

- flutter_bloc: For state management
- http: For API calls
- equatable: For value comparison
- cached_network_image: For image caching
- shared_preferences: For local storage

## Contributing

1. Fork the repository
2. Create your feature branch
3. Commit your changes
4. Push to the branch
5. Create a Pull Request

## License

This project is licensed under the MIT License - see the LICENSE file for details
