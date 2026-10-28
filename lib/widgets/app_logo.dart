import 'package:flutter/material.dart';

import '../theme/app_theme.dart';

class AppLogo extends StatelessWidget {
  const AppLogo({super.key, this.iconSize = 64, this.fontSize = 30, this.tagline});

  final double iconSize;
  final double fontSize;
  final String? tagline;

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(Icons.spa_rounded, size: iconSize, color: AppColors.primary),
        const SizedBox(height: 8),
        Text(
          'NoteApp',
          style: TextStyle(
            fontSize: fontSize,
            fontWeight: FontWeight.w600,
            color: AppTheme.accent(context),
          ),
        ),
        if (tagline != null) ...[
          const SizedBox(height: 6),
          Text(tagline!,
              style: TextStyle(color: scheme.onSurfaceVariant, fontSize: 13)),
        ],
      ],
    );
  }
}