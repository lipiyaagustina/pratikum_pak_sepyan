import 'package:flutter/foundation.dart';
import '../models/siswa.dart';
import '../models/kehadiran_record.dart';

class KehadiranProvider with ChangeNotifier {
  final List<Siswa> _murid = [
    Siswa(name: 'Ali', muridId: '2024001'),
    Siswa(name: 'Budi', muridId: '2024002'),
    Siswa(name: 'Citra', muridId: '2024003'),
    Siswa(name: 'wahuni', muridId: '2024004'),
  ];

  final List<KehadiranRecord> _records = [];

  List<Siswa> get murid => _murid;
  List<KehadiranRecord> get records => _records;

  bool get hasMurid => _murid.isNotEmpty;

  void toggleKehadiran(int index) {
    _murid[index].togglePresence();
    notifyListeners();
  }

  void saveKehadiran() {
    final presentMurid =
        _murid.where((murid) => murid.isPresent).toList();
    final absentMurid =
        _murid.where((murid) => !murid.isPresent).toList();

    _records.insert(
      0,
      KehadiranRecord(
        date: DateTime.now(),
        presentCount: presentMurid.length,
        absentCount: absentMurid.length,
        presentMurid: presentMurid,
        absentMurid: absentMurid,
      ),
    );

    // Reset all students
    for (var student in _murid) {
      student.reset();
    }

    notifyListeners();
  }
}
