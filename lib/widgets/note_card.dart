import 'package:flutter/material.dart';

import '../models/note.dart';
import '../theme/app_theme.dart';
import '../utils/date_formatter.dart';

class NoteCard extends StatelessWidget {
  const NoteCard({super.key, required this.note, required this.onTap});

  final Note note;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;

    return Material(
      color: AppTheme.noteBackground(context, note.color),
      borderRadius: BorderRadius.circular(16),
      child: InkWell(
        borderRadius: BorderRadius.circular(16),
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.all(14),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Hero: ikon "terbang" ke halaman detail
              Hero(
                tag: note,
                child: CircleAvatar(
                  radius: 22,
                  backgroundColor: note.category.softColor,
                  child: Icon(note.category.icon,
                      color: note.category.color, size: 22),
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      note.title,
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        color: scheme.onSurface,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      note.content,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(color: scheme.onSurfaceVariant, fontSize: 12),
                    ),
                    const SizedBox(height: 6),
                    Text(
                      DateFormatter.short(note.date),
                      style: TextStyle(color: scheme.onSurfaceVariant, fontSize: 11),
                    ),
                  ],
                ),
              ),
              Icon(Icons.chevron_right_rounded, color: scheme.onSurfaceVariant),
            ],
          ),
        ),
      ),
    );
  }
}