import 'package:flutter/material.dart';
 
import '../data/notes_store.dart';
import '../models/note.dart';
import '../routes/app_routes.dart';
import '../theme/app_theme.dart';
import '../theme/theme_controller.dart';
import '../widgets/note_card.dart';
import '../widgets/summary_card.dart';
 
class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});
 
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}
 
class _HomeScreenState extends State<HomeScreen> {
  /// null berarti filter "Semua".
  NoteCategory? _selected;
 
  bool _isToday(DateTime d) {
    final now = DateTime.now();
    return d.year == now.year && d.month == now.month && d.day == now.day;
  }
 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ValueListenableBuilder<List<Note>>(
          valueListenable: notesNotifier,
          builder: (context, notes, _) {
            final filtered = _selected == null
                ? notes
                : notes.where((n) => n.category == _selected).toList();
 
            return ListView(
              padding: const EdgeInsets.fromLTRB(20, 16, 20, 100),
              children: [
                _buildHeader(context),
                const SizedBox(height: 20),
                SummaryCard(
                  total: notes.length,
                  today: notes.where((n) => _isToday(n.date)).length,
                  important: notes
                      .where((n) => n.category == NoteCategory.penting)
                      .length,
                ),
                const SizedBox(height: 16),
                const TextField(
                  decoration: InputDecoration(
                    hintText: 'Cari catatan...',
                    prefixIcon: Icon(Icons.search, size: 20),
                  ),
                ),
                const SizedBox(height: 16),
                _buildFilterChips(context),
                const SizedBox(height: 16),
                if (filtered.isEmpty)
                  _buildEmptyState(context)
                else
                  for (final note in filtered)
                    Padding(
                      padding: const EdgeInsets.only(bottom: 12),
                      child: NoteCard(
                        note: note,
                        onTap: () => Navigator.pushNamed(
                          context,
                          AppRoutes.detailNote,
                          arguments: note,
                        ),
                      ),
                    ),
              ],
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: AppColors.primary,
        foregroundColor: Colors.white,
        shape: const CircleBorder(),
        onPressed: () => Navigator.pushNamed(context, AppRoutes.addNote),
        child: const Icon(Icons.add),
      ),
      bottomNavigationBar: NavigationBar(
        selectedIndex: 0,
        destinations: const [
          NavigationDestination(
              icon: Icon(Icons.home_outlined),
              selectedIcon: Icon(Icons.home_rounded),
              label: 'Beranda'),
          NavigationDestination(
              icon: Icon(Icons.folder_outlined),
              selectedIcon: Icon(Icons.folder_rounded),
              label: 'Semua'),
          NavigationDestination(
              icon: Icon(Icons.person_outline),
              selectedIcon: Icon(Icons.person_rounded),
              label: 'Profil'),
        ],
      ),
    );
  }
 
  Widget _buildHeader(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;
    final isDark = scheme.brightness == Brightness.dark;
 
    return Row(
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Halo, Atina Zahara 🤍',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w700,
                  color: scheme.onSurface,
                ),
              ),
              const SizedBox(height: 2),
              Text('Mulai catatanmu hari ini.!',
                  style: TextStyle(color: scheme.onSurfaceVariant, fontSize: 12)),
            ],
          ),
        ),
        // Tombol ganti tema terang/gelap
        IconButton.filledTonal(
          tooltip: isDark ? 'Mode terang' : 'Mode gelap',
          onPressed: () {
            themeModeNotifier.value = isDark ? ThemeMode.light : ThemeMode.dark;
          },
          icon: Icon(
            isDark ? Icons.light_mode_outlined : Icons.dark_mode_outlined,
            size: 20,
          ),
        ),
      ],
    );
  }
 
  Widget _buildFilterChips(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;
    final options = <NoteCategory?>[null, ...NoteCategory.values];
 
    return SizedBox(
      height: 40,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: options.length,
        separatorBuilder: (_, __) => const SizedBox(width: 8),
        itemBuilder: (context, index) {
          final category = options[index];
          final selected = _selected == category;
 
          return ChoiceChip(
            label: Text(category?.label ?? 'Semua'),
            selected: selected,
            showCheckmark: false,
            onSelected: (_) => setState(() => _selected = category),
            selectedColor: AppColors.primary,
            backgroundColor: scheme.surface,
            side: BorderSide.none,
            shape: const StadiumBorder(),
            labelStyle: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w600,
              color: selected ? Colors.white : scheme.onSurface,
            ),
          );
        },
      ),
    );
  }
 
  Widget _buildEmptyState(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;
 
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 40),
      child: Column(
        children: [
          Icon(Icons.note_alt_outlined, size: 56, color: scheme.onSurfaceVariant),
          const SizedBox(height: 12),
          Text(
            'Belum ada catatan di kategori ini',
            style: TextStyle(color: scheme.onSurfaceVariant),
          ),
        ],
      ),
    );
  }
}
 

