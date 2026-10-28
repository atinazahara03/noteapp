import 'package:flutter/material.dart';

import '../models/note.dart';
import '../theme/app_theme.dart';
import '../utils/date_formatter.dart';

class DetailNoteScreen extends StatelessWidget {
  const DetailNoteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final note = ModalRoute.of(context)!.settings.arguments as Note;
    final scheme = Theme.of(context).colorScheme;

    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(onPressed: () {}, icon: const Icon(Icons.more_vert_rounded)),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(20, 0, 20, 24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildHeaderCard(context, note),
            const SizedBox(height: 24),
            const _SectionTitle('Isi Catatan'),
            const SizedBox(height: 8),
            Text(
              note.content.isEmpty ? '-' : note.content,
              style: TextStyle(color: scheme.onSurfaceVariant, height: 1.6, fontSize: 13),
            ),
            const SizedBox(height: 16),
            const Divider(),
            const SizedBox(height: 16),
            const _SectionTitle('Kategori'),
            const SizedBox(height: 8),
            _CategoryChip(category: note.category),
            const Spacer(),
            OutlinedButton.icon(
              onPressed: () {},
              icon: const Icon(Icons.edit_outlined, size: 18),
              label: const Text('Edit'),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildHeaderCard(BuildContext context, Note note) {
    final scheme = Theme.of(context).colorScheme;

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 28),
      decoration: BoxDecoration(
        color: AppTheme.noteBackground(context, note.color),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        children: [
          Hero(
            tag: note,
            child: CircleAvatar(
              radius: 30,
              backgroundColor: note.category.softColor,
              child: Icon(note.category.icon, color: note.category.color, size: 28),
            ),
          ),
          const SizedBox(height: 14),
          Text(
            note.title,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w700,
              color: scheme.onSurface,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            DateFormatter.long(note.date),
            style: TextStyle(color: scheme.onSurfaceVariant, fontSize: 12),
          ),
        ],
      ),
    );
  }
}

class _SectionTitle extends StatelessWidget {
  const _SectionTitle(this.text);

  final String text;

  @override
  Widget build(BuildContext context) => Text(
        text,
        style: TextStyle(
          fontWeight: FontWeight.w700,
          color: Theme.of(context).colorScheme.onSurface,
        ),
      );
}

class _CategoryChip extends StatelessWidget {
  const _CategoryChip({required this.category});

  final NoteCategory category;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        color: category.softColor,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text(
        category.label,
        style: TextStyle(
          fontSize: 11,
          fontWeight: FontWeight.w600,
          color: category.color,
        ),
      ),
    );
  }
}