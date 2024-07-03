import 'package:flutter/material.dart';
import 'package:practica2/entities/student_entity.dart';
import 'package:practica2/settings/db_connection.dart';

class StudentCreate extends StatefulWidget {
  const StudentCreate({super.key});
  @override
  State<StudentCreate> createState() => _StudentCreateState();
}

class _StudentCreateState extends State<StudentCreate> {
  final studentForm = GlobalKey<FormState>(); //id de formulario
  final nombreController = TextEditingController(); // id de textfiel de nombre
  final apellidoController = TextEditingController(); // id de textfiel apellido
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Crear estudiante'),
        ),
        body: Padding(
          padding: const EdgeInsets.all(20), // todos los margenes de 20
          child: Form(
              key: studentForm, // crear un widget para formulario
              child: Column(
                //añado una column para involucrar varios elementos
                children: [
                  TextFormField(
                    controller: nombreController,
                    decoration: const InputDecoration(
                        labelText: 'Nombre'), // placeholder
                    validator: (value) {
                      //programar una funcion de validacion
                      if (value == null || value.isEmpty) {
                        return 'Este campo es requerido';
                      }
                      return null;
                    },
                  ), //caja de texto enlazada al formulario
                  const SizedBox(
                    height: 20,
                  ), // Agregar un espacio
                  TextFormField(
                    controller: apellidoController,
                    decoration: const InputDecoration(
                        labelText: 'Apellido'), // placeholder
                    validator: (value) {
                      //programar una funcion de validacion
                      if (value == null || value.isEmpty) {
                        return 'Este campo es requerido';
                      }
                      return null;
                    },
                  ), //caja de texto enlazada al formulario
                  const SizedBox(
                    height: 20,
                  ), //agregar espacio
                  ElevatedButton(
                      onPressed: () {
                        Navigator.of(context).pushNamed('/vestudiante');

                        insert();
                      },
                      child: const Text('Insertar Estudiante'))
                ],
              )),
        ));
  }

  insert() async {
    // ignore: avoid_print
    print('llegué a la funcion');
    if (studentForm.currentState!.validate()) {
      studentForm.currentState!.save(); //almacena el estado actual
      var data = Student(
          name: nombreController.text,
          lastName: apellidoController.text); // crear instancia con la data
      //llamado a la funcion de insertar
      // ignore: avoid_print
      print(await DbConnection.insert('estudiante', data.toDictionary()));
    } // validando las cajas de texto
  }
}
