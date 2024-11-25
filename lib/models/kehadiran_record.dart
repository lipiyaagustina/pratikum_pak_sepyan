import 'package:presensi/models/siswa.dart';

class KehadiranRecord {
  final DateTime date;
  final int presentCount;
  final int absentCount;
  final List<Siswa> presentMurid;
  final List<Siswa> absentMurid;

  KehadiranRecord({
    required this.date,
    required this.presentCount,
    required this.absentCount,
    required this.presentMurid,
    required this.absentMurid,
  });
}
