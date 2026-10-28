import 'package:flutter/material.dart';

class AppColors {
  AppColors._();

  static const primary = Color(0xFF9B87D8);
  static const primaryDark = Color(0xFF5B3FA8);
  static const primarySoft = Color(0xFFEDE8FA);

  /// Pilihan warna catatan.
  static const noteColors = <Color>[
    Color(0xFFEDE8FA), // ungu
    Color(0xFFFFE3E8), // pink
    Color(0xFFFFEFD9), // oranye
    Color(0xFFDDEBFF), // biru
    Color(0xFFD8F4EC), // hijau
    Color(0xFFFFF6C9), // kuning
  ];
}

class AppTheme {
  AppTheme._();

  static ThemeData get light => _build(
        ColorScheme.fromSeed(
          seedColor: AppColors.primary,
          brightness: Brightness.light,
        ).copyWith(
          primary: AppColors.primary,
          surface: Colors.white,
          onSurface: const Color(0xFF2D2640),
          onSurfaceVariant: const Color(0xFF8A83A0),
          surfaceContainerHighest: const Color(0xFFF3F0FB),
        ),
        const Color(0xFFF7F5FD),
      );

  static ThemeData get dark => _build(
        ColorScheme.fromSeed(
          seedColor: AppColors.primary,
          brightness: Brightness.dark,
        ).copyWith(
          primary: AppColors.primary,
          surface: const Color(0xFF241F33),
          onSurface: const Color(0xFFEDE9F8),
          onSurfaceVariant: const Color(0xFFA9A2BF),
          surfaceContainerHighest: const Color(0xFF2F2942),
        ),
        const Color(0xFF161221),
      );

  /// Warna aksen yang tetap terbaca di mode terang maupun gelap.
  static Color accent(BuildContext context) =>
      Theme.of(context).brightness == Brightness.dark
          ? const Color(0xFFC9BBF5)
          : AppColors.primaryDark;

  /// Warna latar catatan: di mode gelap dibuat lebih redup.
  static Color noteBackground(BuildContext context, Color base) {
    final scheme = Theme.of(context).colorScheme;
    if (scheme.brightness == Brightness.dark) {
      return Color.alphaBlend(base.withValues(alpha: 0.18), scheme.surface);
    }
    return base;
  }

  static ThemeData _build(ColorScheme scheme, Color background) {
    final radius = BorderRadius.circular(12);
    final isDark = scheme.brightness == Brightness.dark;

    return ThemeData(
      useMaterial3: true,
      colorScheme: scheme,
      scaffoldBackgroundColor: background,
      appBarTheme: AppBarTheme(
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        foregroundColor: scheme.onSurface,
        titleTextStyle: TextStyle(
          color: scheme.onSurface,
          fontSize: 16,
          fontWeight: FontWeight.w600,
        ),
      ),
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: scheme.surfaceContainerHighest,
        hintStyle: TextStyle(color: scheme.onSurfaceVariant, fontSize: 13),
        prefixIconColor: scheme.onSurfaceVariant,
        contentPadding:
            const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
        border: OutlineInputBorder(borderRadius: radius, borderSide: BorderSide.none),
        enabledBorder:
            OutlineInputBorder(borderRadius: radius, borderSide: BorderSide.none),
        focusedBorder: OutlineInputBorder(
          borderRadius: radius,
          borderSide: const BorderSide(color: AppColors.primary, width: 1.5),
        ),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.primary,
          foregroundColor: Colors.white,
          minimumSize: const Size.fromHeight(52),
          elevation: 0,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
          textStyle: const TextStyle(fontSize: 15, fontWeight: FontWeight.w600),
        ),
      ),
      outlinedButtonTheme: OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
          foregroundColor: isDark ? const Color(0xFFC9BBF5) : AppColors.primaryDark,
          minimumSize: const Size.fromHeight(52),
          side: const BorderSide(color: AppColors.primary),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
        ),
      ),
      navigationBarTheme: NavigationBarThemeData(
        backgroundColor: scheme.surface,
        indicatorColor: AppColors.primary.withValues(alpha: 0.25),
      ),
    );
  }
}