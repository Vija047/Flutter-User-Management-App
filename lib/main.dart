import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_user_management_app/blocs/user/user_bloc.dart';
import 'package:flutter_user_management_app/blocs/user/user_event.dart'; // Add this import
import 'package:flutter_user_management_app/screens/user_list_screen.dart';
import 'package:flutter_user_management_app/screens/search_users_screen.dart';
import 'package:flutter_user_management_app/screens/welcome_screen.dart'; // Import WelcomeScreen
import 'package:flutter_user_management_app/services/api_service.dart';
import 'package:flutter_user_management_app/screens/user_detail_screen.dart';
import 'package:flutter_user_management_app/models/user.dart'; // Add this import

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider(create: (context) => ApiService()),
      ],
      child: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => UserBloc(
              apiService: context.read<ApiService>(),
            )..add(FetchUsers()),
          ),
        ],
        child: MaterialApp(
          title: 'User Management App',
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
            useMaterial3: true,
          ),
          darkTheme: ThemeData.dark(useMaterial3: true).copyWith(
            colorScheme: ColorScheme.fromSeed(
              seedColor: Colors.blue,
              brightness: Brightness.dark,
            ),
          ),
          home: const WelcomeScreen(), // Set WelcomeScreen as initial screen
          onGenerateRoute: (settings) {
            switch (settings.name) {
              case '/user-detail':
                final args = settings.arguments;
                if (args is User) {
                  return MaterialPageRoute(
                    builder: (context) => UserDetailScreen(user: args),
                  );
                }
                return null;
              default:
                return null;
            }
          },
        ),
      ),
    );
  }
}
