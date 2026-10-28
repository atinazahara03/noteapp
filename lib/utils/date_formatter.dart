class DateFormatter {
  DateFormatter._();

  static const _months = [
    'Januari', 'Februari', 'Maret', 'April', 'Mei', 'Juni',
    'Juli', 'Agustus', 'September', 'Oktober', 'November', 'Desember',
  ];

  /// Contoh: 28 Oktober 2026
  static String long(DateTime d) => '${d.day} ${_months[d.month - 1]} ${d.year}';

  /// Contoh: 28 Okt 2026
  static String short(DateTime d) =>
      '${d.day} ${_months[d.month - 1].substring(0, 3)} ${d.year}';
}