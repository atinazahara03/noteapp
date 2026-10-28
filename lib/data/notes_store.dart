import 'package:flutter/foundation.dart';

import '../models/note.dart';
import 'dummy_notes.dart';

/// Daftar catatan yang dipakai seluruh aplikasi.
/// Setiap perubahan otomatis memperbarui tampilan yang memantaunya.
final ValueNotifier<List<Note>> notesNotifier =
    ValueNotifier<List<Note>>(List.of(dummyNotes));

/// Menambah catatan baru di urutan paling atas.
void saveNote(Note note) {
  notesNotifier.value = [note, ...notesNotifier.value];
}