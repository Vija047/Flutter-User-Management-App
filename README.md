# Flutter User Management App

A comprehensive Flutter application demonstrating modern app development practices with BLoC pattern, REST API integration, and clean architecture.

## Project Overview

This project is a user management application that showcases best practices in Flutter development, including:
- State management with BLoC pattern
- REST API integration with pagination
- Clean architecture principles
- Modern UI design with Material 3

## Requirements Implementation

### 1. API Integration 
- Integration with DummyJSON Users API
- Implemented pagination using limit/skip parameters
- Real-time search functionality by user name
- Infinite scrolling in user list
- Nested API calls for user posts and todos

### 2. BLoC State Management 
- Implemented using flutter_bloc package
- Proper state handling (Loading, Success, Error)
- Separate events for different operations
- Efficient nested data management

### 3. UI Features 
- User List with avatars and details
- Real-time search implementation
- Detailed user profile view
- Posts and todos management
- Loading indicators and error handling
- Responsive and user-friendly design

### 4. Code Quality 
- Clean architecture implementation
- Proper folder structure
- Error handling and edge cases
- Flutter/Dart best practices

### 5. Bonus Features 
- Pull-to-refresh functionality
- Offline data caching
- Theme switching (Light/Dark)

## Technical Details

### API Endpoints
```
Base URL: https://dummyjson.com
- Users: /users?limit={limit}&skip={skip}
- Search: /users/search?q={query}
- User Posts: /posts/user/{userId}
- User Todos: /todos/user/{userId}
```

### Project Structure
```
lib/
├── blocs/          # BLoC pattern implementation
├── models/         # Data models
├── screens/        # UI screens
├── services/       # API and local storage services
└── utils/         # Helper functions and constants
```

### Core Features
1. User Management
   - View user list with pagination
   - Search users in real-time
   - View detailed user profiles

2. Post Management
   - View user posts
   - Create new posts
   - Manage post interactions

3. Todo Management
   - View user todos
   - Track todo completion status

## Setup Instructions

### Environment Requirements
- Flutter SDK (3.x or higher)
- Dart SDK (3.x or higher)
- Android Studio / VS Code
- Git

### Step-by-Step Setup
1. Clone the repository
```bash
git clone https://github.com/yourusername/flutter_user_management_app.git
cd flutter_user_management_app
```

2. Install dependencies
```bash
flutter pub get
```

3. Configure Android Studio/VS Code
- Install Flutter and Dart plugins
- Set up Flutter SDK path
- Configure an emulator/simulator

4. Run the application
```bash
# For development
flutter run

# For release build
flutter build apk --release
```

### Troubleshooting
Common issues and solutions:
- Gradle build fails: Run `flutter clean` and try again
- Plugin issues: Update Flutter and dependencies
- Android SDK issues: Verify SDK installation and paths

## Project Architecture

### Layer Structure
```
lib/
├── blocs/          # Business Logic Components
│   └── user/       # User-related state management
├── models/         # Data models and entities
├── screens/        # UI components and screens
├── services/       # API and external services
└── utils/          # Helper functions and constants
```

### Design Patterns
1. BLoC Pattern
   - State management
   - Event handling
   - Data flow control

2. Repository Pattern
   - Data abstraction
   - API integration
   - Cache management

3. Clean Architecture
   - Separation of concerns
   - Dependency injection
   - Testable components

### Error Handling
```
UI Layer → Shows user-friendly messages
↓
BLoC Layer → Manages error states
↓
Service Layer → Handles API/technical errors
```

## Quality Assurance

### Code Quality
- Lint rules enforced
- Code formatting with dartfmt
- Documentation standards
- Error handling guidelines

### Testing Coverage
- Unit tests for business logic
- Widget tests for UI components
- Integration tests for API
- Performance testing

### Performance Metrics
- Startup time < 2s
- Frame rate > 60fps
- Memory usage < 100MB
- API response < 1s

## Testing
- Unit tests for BLoC logic
- Widget tests for UI components
- Integration tests for API calls

## Performance Optimization
- Lazy loading
- Image caching
- Efficient state management
- Minimal rebuilds

## Contributing
Contributions are welcome! Please read our contributing guidelines before submitting PRs.

## License
This project is licensed under the MIT License - see the LICENSE file for details.

## App Preview

### Video Demo

<details>
<summary>Alternative Video Links</summary>
- [Watch on Loom](https://www.loom.com/share/3586be841f03402eb62aad9da9874451?sid=448e9724-3776-40d1-b792-3b7e9914cb2b)
</details>

> Note: If the video links are not accessible, please check the `/videos` directory in the project root for a local copy.

### Screenshots

<div style="display: flex; flex-wrap: wrap; gap: 10px;">

#### Welcome Screen
![alt text](image.png)

#### Home Dashboard
![alt text](image-1.png)

#### User List
![alt text](image-2.png)"

#### Search Feature
![alt text](image-3.png)" 

#### User Details
![alt text](image-4.png)" 

#### Settings
![alt text](image-5.png)" 
</div>

### Key Features Demonstrated
- Material 3 Design
- Smooth Animations
- Responsive Layout
- Dark/Light Theme
- Infinite Scrolling
- Real-time Search
