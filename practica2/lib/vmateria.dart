import 'package:flutter/material.dart';
import 'package:practica2/entities/materia_entity.dart';

class Materias extends StatelessWidget {
  const Materias({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text("Lista de Materias"),
        ),
      ),
      body: FutureBuilder<List<Materia>>(
        future: Materia.select(),
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
            List<Materia> data = snapshot.data as List<Materia>;
            return ListView.builder(
                itemCount: data.length,
                itemBuilder: (context, i) {
                  return Card(
                    child: Text(
                        '${data[i].name} ${data[i].descripcion} ${data[i].creditos} ${data[i].area} ${data[i].estado}'),
                  );
                });
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).pushNamed('/materia/create');
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
