import 'package:flutter/material.dart';
import 'package:practica2/entities/carrera_enity.dart';

class Carreras extends StatelessWidget {
  const Carreras({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text("Lista de Carreras"),
        ),
      ),
      body: FutureBuilder<List<Carrera>>(
        future: Carrera.select(),
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
            List<Carrera> data = snapshot.data as List<Carrera>;
            return ListView.builder(
                itemCount: data.length,
                itemBuilder: (context, i) {
                  return Card(
                    child: Text(
                        '${data[i].name} ${data[i].duracion} ${data[i].titulo} ${data[i].facultad} ${data[i].plandeEstudios}'),
                  );
                });
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).pushNamed('/carrera/create');
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
