import 'package:flutter/material.dart';
import '../Provider/kehadiran_provider.dart';

class AbsensiScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<KehadiranProvider>(context);

    return Scaffold(
      appBar: AppBar(title: Text('Presensi Siswa')),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: provider.siswaList.length,
              itemBuilder: (context, index) {
                final siswa = provider.siswaList[index];
                return CheckboxListTile(
                  title: Text(siswa.name),
                  value: siswa.isPresent,
                  onChanged: (value) {
                    siswa.isPresent = value ?? false;
                    provider.notifyListeners();
                  },
                );
              },
            ),
          ),
          ElevatedButton(
            onPressed:
                provider.siswaList.isEmpty ? null : provider.simpanKehadiran,
            child: Text('Simpan Kehadiran'),
          ),
        ],
      ),
    );
  }
}
