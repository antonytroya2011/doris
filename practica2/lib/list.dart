
import 'package:flutter/material.dart';
import 'package:practica2/entities/student_entity.dart';

class Lista extends StatelessWidget{
  const Lista({super.key});
  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(title: const Text("Sistema Ecolástico"),),
      body:FutureBuilder<List<Student>>(
        future: Student.select(),
        builder: (context, snapshot){
          if(snapshot.connectionState == ConnectionState.waiting){
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if(snapshot.hasError){
            return Center(
              child: Text("Error: ${snapshot.error}"),
            );
          }else{
            List<Student> data = snapshot.data as List<Student>;
            return ListView.builder(
              itemCount: data.length,
              itemBuilder: (context, i){
                return Card(
                  child: Text(data[i].name),
                );
                
              }
            );
          }
        },
        
      ),
      
      floatingActionButton: FloatingActionButton(
        onPressed:() {
          Navigator.pushNamed(context, '/student/create');
          Navigator.pushNamed(context, '/materia/create');
          Navigator.pushNamed(context, '/carrera/create');
          Navigator.pushNamed(context, '/docente/create');
          //Navigator.of(context).pushNamed('/home');
        },
        
        child: const Icon(Icons.add),
      ),
    );
  }
}