import 'package:flutter/material.dart';
import 'package:practica2/entities/student_entity.dart';

class Estudiantes extends StatelessWidget {
  const Estudiantes({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text("Lista de Estudiantes"),
        ),
      ),
      body: FutureBuilder<List<Student>>(
        future: Student.select(),
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
            List<Student> data = snapshot.data as List<Student>;
            return ListView.builder(
                itemCount: data.length,
                itemBuilder: (context, i) {
                  return Card(
                    child: Text('${data[i].name} ${data[i].lastName}'),
                  );
                });
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).pushNamed('/student/create');
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
