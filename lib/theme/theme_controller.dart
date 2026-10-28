import 'package:flutter/material.dart';

/// Menyimpan mode tema aktif (terang/gelap). Dipantau oleh MaterialApp.
final ValueNotifier<ThemeMode> themeModeNotifier =
    ValueNotifier<ThemeMode>(ThemeMode.light);