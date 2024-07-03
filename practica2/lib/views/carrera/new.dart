import 'package:flutter/material.dart';
import 'package:practica2/entities/carrera_enity.dart';

import 'package:practica2/settings/db_connection.dart';

class CarreraCreate extends StatefulWidget {
  const CarreraCreate({super.key});
  @override
  State<CarreraCreate> createState() => _CarreraCreateState();
}

class _CarreraCreateState extends State<CarreraCreate> {
  final carreraForm = GlobalKey<FormState>(); //id de formulario
  final nombreController = TextEditingController(); // id de textfiel de nombre
  final duracionController = TextEditingController(); // id de textfiel apellido
  final tituloController = TextEditingController();
  final facultadController = TextEditingController();
  final plandeestudiosController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Crear carrera'),
        ),
        body: Padding(
          padding: const EdgeInsets.all(20), // todos los margenes de 20
          child: Form(
              key: carreraForm, // crear un widget para formulario
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
                    controller: duracionController,
                    decoration: const InputDecoration(
                        labelText: 'Duracion'), // placeholder
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
                    controller: tituloController,
                    decoration: const InputDecoration(
                        labelText: 'Titulo'), // placeholder
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
                    controller: facultadController,
                    decoration: const InputDecoration(
                        labelText: 'Facultad'), // placeholder
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
                    controller: plandeestudiosController,
                    decoration: const InputDecoration(
                        labelText: 'Plan de estudio'), // placeholder
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
                        Navigator.of(context).pushNamed('/vcarrera');

                        insert();
                      },
                      child: const Text('Insertar Carrera'))
                ],
              )),
        ));
  }

  insert() async {
    // ignore: avoid_print
    print('llegué a la funcion');
    if (carreraForm.currentState!.validate()) {
      carreraForm.currentState!.save(); //almacena el estado actual
      var data = Carrera(
          name: nombreController.text,
          duracion: duracionController.text,
          titulo: tituloController.text,
          facultad: facultadController.text,
          plandeEstudios:
              plandeestudiosController.text); // crear instancia con la data
      //llamado a la funcion de insertar
      // ignore: avoid_print
      print(await DbConnection.insert('carrera', data.toDictionary()));
    } // validando las cajas de texto
  }
}
