import 'package:flutter/material.dart';

import 'routes/app_routes.dart';
import 'screens/add_note_screen.dart';
import 'screens/detail_note_screen.dart';
import 'screens/home_screen.dart';
import 'screens/login_screen.dart';
import 'screens/splash_screen.dart';
import 'theme/app_theme.dart';
import 'theme/theme_controller.dart';

void main() => runApp(const NoteApp());

class NoteApp extends StatelessWidget {
  const NoteApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<ThemeMode>(
      valueListenable: themeModeNotifier,
      builder: (context, mode, _) {
        return MaterialApp(
          title: 'NoteApp',
          debugShowCheckedModeBanner: false,
          theme: AppTheme.light,
          darkTheme: AppTheme.dark,
          themeMode: mode,
          initialRoute: AppRoutes.splash,
          routes: {
            AppRoutes.splash: (_) => const SplashScreen(),
            AppRoutes.login: (_) => const LoginScreen(),
            AppRoutes.home: (_) => const HomeScreen(),
            AppRoutes.addNote: (_) => const AddNoteScreen(),
            AppRoutes.detailNote: (_) => const DetailNoteScreen(),
          },
        );
      },
    );
  }
}