import 'package:flutter/material.dart';
import 'package:practica2/entities/docente_entity.dart';

class Docentes extends StatelessWidget {
  const Docentes({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text("Lista de Docentes"),
        ),
      ),
      body: FutureBuilder<List<Docente>>(
        future: Docente.select(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (snapshot.hasError) {
            return Center(
              child: Text("Error: ${snapshot.error} "),
            );
          } else {
            // ignore: unused_local_variable
            List<Docente> data = snapshot.data as List<Docente>;
            return ListView.builder(
                itemCount: data.length,
                itemBuilder: (context, i) {
                  return Card(
                    child: Text(
                        '${data[i].name} ${data[i].last_name} ${data[i].direccion} ${data[i].telefono} ${data[i].especialidad}'),
                  );
                });
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).pushNamed('/docente/create');
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
