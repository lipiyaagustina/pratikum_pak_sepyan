import 'package:flutter/material.dart';
import '../provider/kehadiran_provider.dart';

class RiwayatScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<KehadiranProvider>(context);

    return Scaffold(
      appBar: AppBar(title: Text('Riwayat Kehadiran')),
      body: ListView.builder(
        itemCount: provider.riwayat.length,
        itemBuilder: (context, index) {
          final riwayat = provider.riwayat[index];
          return ListTile(
            title: Text(riwayat.date.toIso8601String().split('T')[0]),
            subtitle: Text(
                'Hadir: ${riwayat.hadir}, Tidak Hadir: ${riwayat.tidakHadir}'),
          );
        },
      ),
    );
  }
}
