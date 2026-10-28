import 'package:flutter/material.dart';

import '../routes/app_routes.dart';
import '../theme/app_theme.dart';
import '../widgets/app_logo.dart';

/// Login statis: hanya desain UI, tanpa autentikasi.
class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;

    return Scaffold(
      body: Stack(
        children: [
          // Dekorasi lingkaran di pojok kiri atas
          Positioned(
            top: -90,
            left: -70,
            child: Container(
              width: 220,
              height: 220,
              decoration: BoxDecoration(
                color: scheme.primary.withValues(alpha: 0.18),
                shape: BoxShape.circle,
              ),
            ),
          ),
          SafeArea(
            child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 28),
              child: Column(
                children: [
                  const SizedBox(height: 70),
                  const AppLogo(iconSize: 48, fontSize: 24),
                  const SizedBox(height: 32),
                  Text(
                    'Selamat datang!',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w700,
                      color: scheme.onSurface,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'Mulai catat hal-hal penting\ndalam hidupmu.',
                    textAlign: TextAlign.center,
                    style: TextStyle(color: scheme.onSurfaceVariant, fontSize: 13),
                  ),
                  const SizedBox(height: 32),
                  const TextField(
                    decoration: InputDecoration(
                      hintText: 'Username',
                      prefixIcon: Icon(Icons.person_outline, size: 20),
                    ),
                  ),
                  const SizedBox(height: 14),
                  const TextField(
                    obscureText: true,
                    decoration: InputDecoration(
                      hintText: 'Password',
                      prefixIcon: Icon(Icons.lock_outline, size: 20),
                    ),
                  ),
                  const SizedBox(height: 24),
                  ElevatedButton(
                    onPressed: () =>
                        Navigator.pushReplacementNamed(context, AppRoutes.home),
                    child: const Text('Masuk'),
                  ),
                  const SizedBox(height: 20),
                  Text.rich(
                    TextSpan(
                      text: 'Belum punya akun? ',
                      style: TextStyle(color: scheme.onSurfaceVariant, fontSize: 12),
                      children: [
                        TextSpan(
                          text: 'Daftar',
                          style: TextStyle(
                            color: AppTheme.accent(context),
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}