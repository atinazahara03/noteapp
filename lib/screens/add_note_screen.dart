import 'package:flutter/material.dart';

import '../data/notes_store.dart';
import '../models/note.dart';
import '../theme/app_theme.dart';
import '../utils/date_formatter.dart';

class AddNoteScreen extends StatefulWidget {
  const AddNoteScreen({super.key});

  @override
  State<AddNoteScreen> createState() => _AddNoteScreenState();
}

class _AddNoteScreenState extends State<AddNoteScreen> {
  final _titleController = TextEditingController();
  final _contentController = TextEditingController();
  final _dateController = TextEditingController();

  NoteCategory _category = NoteCategory.pekerjaan;
  DateTime _date = DateTime.now();
  Color _color = AppColors.noteColors.first;

  @override
  void initState() {
    super.initState();
    _dateController.text = DateFormatter.long(_date);
  }

  @override
  void dispose() {
    _titleController.dispose();
    _contentController.dispose();
    _dateController.dispose();
    super.dispose();
  }

  Future<void> _pickDate() async {
    final picked = await showDatePicker(
      context: context,
      initialDate: _date,
      firstDate: DateTime(2020),
      lastDate: DateTime(2100),
    );
    if (picked == null) return;
    setState(() {
      _date = picked;
      _dateController.text = DateFormatter.long(picked);
    });
  }

  void _save() {
    final messenger = ScaffoldMessenger.of(context);
    final title = _titleController.text.trim();

    if (title.isEmpty) {
      messenger.showSnackBar(
        const SnackBar(content: Text('Judul catatan wajib diisi')),
      );
      return;
    }

    saveNote(
      Note(
        title: title,
        content: _contentController.text.trim(),
        date: _date,
        category: _category,
        color: _color,
      ),
    );

    Navigator.pop(context);
    messenger.showSnackBar(
      const SnackBar(content: Text('Catatan berhasil disimpan')),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Tambah Catatan')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const _FieldLabel('Judul Catatan'),
            TextField(
              controller: _titleController,
              decoration: const InputDecoration(hintText: 'Masukkan judul catatan'),
            ),
            const SizedBox(height: 18),
            const _FieldLabel('Isi Catatan'),
            TextField(
              controller: _contentController,
              maxLines: 6,
              decoration: const InputDecoration(hintText: 'Tulis isi catatan di sini...'),
            ),
            const SizedBox(height: 18),
            const _FieldLabel('Kategori'),
            DropdownButtonFormField<NoteCategory>(
              value: _category,
              icon: const Icon(Icons.keyboard_arrow_down_rounded),
              decoration: InputDecoration(
                prefixIcon: Icon(_category.icon, size: 20, color: _category.color),
              ),
              items: NoteCategory.values
                  .map((c) => DropdownMenuItem(value: c, child: Text(c.label)))
                  .toList(),
              onChanged: (value) {
                if (value != null) setState(() => _category = value);
              },
            ),
            const SizedBox(height: 18),
            const _FieldLabel('Tanggal'),
            TextField(
              controller: _dateController,
              readOnly: true,
              onTap: _pickDate,
              decoration: const InputDecoration(
                prefixIcon: Icon(Icons.calendar_month_outlined, size: 20),
              ),
            ),
            const SizedBox(height: 18),
            const _FieldLabel('Warna Catatan'),
            _buildColorPicker(context),
            const SizedBox(height: 32),
            ElevatedButton(onPressed: _save, child: const Text('Simpan')),
          ],
        ),
      ),
    );
  }

  Widget _buildColorPicker(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;

    return Wrap(
      spacing: 12,
      runSpacing: 12,
      children: AppColors.noteColors.map((c) {
        final selected = c == _color;
        return GestureDetector(
          onTap: () => setState(() => _color = c),
          child: Container(
            width: 42,
            height: 42,
            decoration: BoxDecoration(
              color: c,
              shape: BoxShape.circle,
              border: Border.all(
                color: selected ? AppColors.primary : scheme.outlineVariant,
                width: selected ? 2.5 : 1,
              ),
            ),
            child: selected
                ? const Icon(Icons.check_rounded,
                    size: 20, color: AppColors.primaryDark)
                : null,
          ),
        );
      }).toList(),
    );
  }
}

class _FieldLabel extends StatelessWidget {
  const _FieldLabel(this.text);

  final String text;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Text(
        text,
        style: TextStyle(
          fontWeight: FontWeight.w600,
          fontSize: 13,
          color: Theme.of(context).colorScheme.onSurface,
        ),
      ),
    );
  }
}