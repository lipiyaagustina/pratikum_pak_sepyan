class Siswa {
  final String name; // Nama siswa
  bool isPresent; // Status kehadiran siswa

  Siswa({required this.name, this.isPresent = false});
}

class RiwayatKehadiran {
  DateTime date;
  int hadir;
  int tidakHadir;

  RiwayatKehadiran({
    required this.date,
    required this.hadir,
    required this.tidakHadir,
  });
}
