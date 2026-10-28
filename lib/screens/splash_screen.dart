import 'package:flutter/material.dart';

import '../routes/app_routes.dart';
import '../widgets/app_logo.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  double _opacity = 0;

  @override
  void initState() {
    super.initState();

    // Mulai fade-in setelah frame pertama tergambar.
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (mounted) setState(() => _opacity = 1);
    });

    Future.delayed(const Duration(seconds: 3), () {
      if (!mounted) return;
      Navigator.pushReplacementNamed(context, AppRoutes.login);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: AnimatedOpacity(
          opacity: _opacity,
          duration: const Duration(milliseconds: 1500),
          curve: Curves.easeIn,
          child: const AppLogo(
            iconSize: 80,
            fontSize: 34,
            tagline: 'Catat. Simpan. Ingat.',
          ),
        ),
      ),
    );
  }
}