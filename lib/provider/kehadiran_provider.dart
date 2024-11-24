import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import '../models/siswa.dart';

class KehadiranProvider with ChangeNotifier {
  List<Siswa> _siswaList = [
    Siswa(name: 'Ali'),
    Siswa(name: 'Budi'),
    Siswa(name: 'Citra'),
  ];

  List<RiwayatKehadiran> _riwayat = [];

  List<Siswa> get siswaList => _siswaList;
  List<RiwayatKehadiran> get riwayat => _riwayat;

  void simpanKehadiran() {
    final hadir = _siswaList.where((siswa) => siswa.isPresent).length;
    final tidakHadir = _siswaList.length - hadir;
    _riwayat.insert(
      0,
      RiwayatKehadiran(
        date: DateTime.now(),
        hadir: hadir,
        tidakHadir: tidakHadir,
      ),
    );
    for (var siswa in _siswaList) {
      siswa.isPresent = false;
    }
    notifyListeners();
  }
}
