import 'package:flutter/material.dart';
import 'package:flutter_grps/screens/auth_screen.dart';
import 'package:flutter_grps/screens/navigation_screen.dart';
import 'package:flutter_grps/services/auth_service.dart';
import 'package:flutter_grps/services/theme_service.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ListenableBuilder(
      listenable: ThemeService(),
      builder: (context, _) {
        final isDarkMode = ThemeService().isDarkMode;
        return MaterialApp(
          title: 'Real-time Location Tracker',
          themeMode: isDarkMode ? ThemeMode.dark : ThemeMode.light,
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
            useMaterial3: true,
          ),
          darkTheme: ThemeData(
            colorScheme: ColorScheme.fromSeed(
              seedColor: Colors.blue,
              brightness: Brightness.dark,
            ),
            useMaterial3: true,
            scaffoldBackgroundColor: const Color(0xFF121212),
          ),
          debugShowCheckedModeBanner: false,
          home: FutureBuilder<bool>(
            future: AuthService().hasToken(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Scaffold(
                  body: Center(
                    child: CircularProgressIndicator(),
                  ),
                );
              }
              if (snapshot.data == true) {
                return const NavigationScreen();
              }
              return const AuthScreen();
            },
          ),
        );
      },
    );
  }
}
