import '../models/note.dart';
import '../theme/app_theme.dart';

final _now = DateTime.now();

final List<Note> dummyNotes = [
  Note(
    title: 'Tugas Matkul',
    content:
        'Kerjakan laporan akhir PBL minggu ini sesuai dengan jadwal.',
    date: _now,
    category: NoteCategory.pekerjaan,
    color: AppColors.noteColors[0],
  ),
  Note(
    title: 'Belanja Bulanan',
    content: 'Beli kebutuhan rumah tangga.',
    date: _now.subtract(const Duration(days: 1)),
    category: NoteCategory.pribadi,
    color: AppColors.noteColors[2],
  ),
  Note(
    title: 'Ide Project',
    content: 'Rencana aplikasi mobile untuk SPARA.',
    date: _now.subtract(const Duration(days: 2)),
    category: NoteCategory.penting,
    color: AppColors.noteColors[3],
  ),
  Note(
    title: 'Jadwal Kuliah',
    content: 'Senin - Jumat, cek di SILAM.',
    date: _now.subtract(const Duration(days: 3)),
    category: NoteCategory.pekerjaan,
    color: AppColors.noteColors[4],
  ),
];