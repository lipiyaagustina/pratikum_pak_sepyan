import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../provider/kehadiran_provider.dart';
import 'package:intl/intl.dart';

class RiwayatScreen extends StatelessWidget {
  const RiwayatScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Builder(
      builder: (context) {
        return Consumer<KehadiranProvider>(
          builder: (context, KehadiranProvider, child) {
            if (KehadiranProvider.records.isEmpty) {
              return const Center(
                child: Text('Belum ada riwayat presensi'),
              );
            }

            return ListView.builder(
              itemCount: KehadiranProvider.records.length,
              itemBuilder: (context, index) {
                final record = KehadiranProvider.records[index];
                return Card(
                  margin: const EdgeInsets.all(8.0),
                  child: ExpansionTile(
                    title: Text(
                      'Tanggal: ${DateFormat('dd/MM/yyyy HH:mm').format(record.date)}',
                    ),
                    subtitle: Text(
                      'Hadir: ${record.presentCount}, Tidak Hadir: ${record.absentCount}',
                    ),
                    children: [
                      if (record.presentMurid.isNotEmpty)
                        ListTile(
                          title: const Text('Siswa Hadir:'),
                          subtitle: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: record.presentMurid
                                .map((murid) => Padding(
                                      padding:
                                          const EdgeInsets.only(left: 16.0),
                                      child: Text('${murid.name}'),
                                    ))
                                .toList(),
                          ),
                        ),
                      if (record.absentMurid.isNotEmpty)
                        ListTile(
                          title: const Text('Siswa Tidak Hadir:'),
                          subtitle: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: record.absentMurid
                                .map((student) => Padding(
                                      padding:
                                          const EdgeInsets.only(left: 16.0),
                                      child: Text(
                                          '${student.name} (${student.muridId})'),
                                    ))
                                .toList(),
                          ),
                        ),
                    ],
                  ),
                );
              },
            );
          },
        );
      },
    );
  }
}
