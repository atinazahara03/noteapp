import 'package:flutter/material.dart';

enum NoteCategory {
  pekerjaan('Pekerjaan', Icons.work_outline_rounded, Color(0xFF7E64D4), Color(0xFFEDE8FA)),
  penting('Penting', Icons.star_outline_rounded, Color(0xFFE5566D), Color(0xFFFFE3E8)),
  pribadi('Pribadi', Icons.person_outline_rounded, Color(0xFF2FAE8F), Color(0xFFD8F4EC));

  const NoteCategory(this.label, this.icon, this.color, this.softColor);

  final String label;
  final IconData icon;
  final Color color;
  final Color softColor;
}

class Note {
  const Note({
    required this.title,
    required this.content,
    required this.date,
    required this.category,
    this.color = const Color(0xFFEDE8FA),
  });

  final String title;
  final String content;
  final DateTime date;
  final NoteCategory category;

  /// Warna latar catatan yang dipilih pengguna.
  final Color color;
}