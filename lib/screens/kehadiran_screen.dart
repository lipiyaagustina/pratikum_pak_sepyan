import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../provider/kehadiran_provider.dart';

class KehadiranScreen extends StatelessWidget {
  const KehadiranScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Presensi Siswa',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: const Color.fromARGB(255, 104, 148, 205),
        iconTheme: const IconThemeData(color: Color.fromARGB(255, 120, 163, 237)),
      ),
      body: Column(
        children: [
          Expanded(
            child: Consumer<KehadiranProvider>(
              builder: (context, provider, _) {
                return ListView.builder(
                  itemCount: provider.murid.length,
                  itemBuilder: (context, index) {
                    final student = provider.murid[index];
                    return ListTile(
                      title: Text(student.name),
                      subtitle: Text('NIS: ${student.muridId}'),
                      trailing: Checkbox(
                        value: student.isPresent,
                        onChanged: (_) => provider.toggleKehadiran(index),
                      ),
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
      floatingActionButton: Consumer<KehadiranProvider>(
        builder: (context, provider, _) {
          return FloatingActionButton(
            onPressed: provider. hasMurid ? provider.saveKehadiran : null,
            backgroundColor: Colors.blue,
            child: const Icon(
              Icons.save,
              color: Colors.white,
            ),
          );
        },
      ),
    );
  }
}
