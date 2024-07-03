import 'package:flutter/material.dart';
import 'package:practica2/entities/docente_entity.dart';

import 'package:practica2/settings/db_connection.dart';

class DocenteCreate extends StatefulWidget {
  const DocenteCreate({super.key});
  @override
  State<DocenteCreate> createState() => _DocenteCreateState();
}

class _DocenteCreateState extends State<DocenteCreate> {
  final docenteForm = GlobalKey<FormState>(); //id de formulario
  final nombreController = TextEditingController(); // id de textfiel de nombre
  final apellidoController = TextEditingController(); // id de textfiel apellido
  final direccionController = TextEditingController();
  final telefonoController = TextEditingController();
  final especialidadController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Crear docente'),
        ),
        body: Padding(
          padding: const EdgeInsets.all(20), // todos los margenes de 20
          child: Form(
              key: docenteForm, // crear un widget para formulario
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
                  ), // Agregar un espacio
                  TextFormField(
                    controller: direccionController,
                    decoration: const InputDecoration(
                        labelText: 'Dirección'), // placeholder
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
                    controller: telefonoController,
                    decoration: const InputDecoration(
                        labelText: 'Teléfono'), // placeholder
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
                    controller: especialidadController,
                    decoration: const InputDecoration(
                        labelText: 'Especialidad'), // placeholder
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
                        Navigator.of(context).pushNamed('/vdocente');

                        insert();
                      },
                      child: const Text('Insertar Docente'))
                ],
              )),
        ));
  }

  insert() async {
    print('llegué a la funcion');
    if (docenteForm.currentState!.validate()) {
      docenteForm.currentState!.save(); //almacena el estado actual
      var data = Docente(
          name: nombreController.text,
          last_name: apellidoController.text,
          direccion: direccionController.text,
          telefono: telefonoController.text,
          especialidad:
              especialidadController.text); // crear instancia con la data
      //llamado a la funcion de insertar
      print(await DbConnection.insert('docente', data.toDictionary()));
    } // validando las cajas de texto
  }
}
