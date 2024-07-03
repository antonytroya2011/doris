import 'package:flutter/material.dart';
import 'package:practica2/entities/materia_entity.dart';
import 'package:practica2/settings/db_connection.dart';

class MateriaCreate extends StatefulWidget {
  const MateriaCreate({super.key});
  @override
  State<MateriaCreate> createState() => _MateriaCreateState();
}

class _MateriaCreateState extends State<MateriaCreate> {
  final materiaForm = GlobalKey<FormState>(); //id de formulario
  final nombreController = TextEditingController(); // id de textfiel de nombre
  final descripcionController =
      TextEditingController(); // id de textfiel apellido
  final creditosController = TextEditingController();
  final areaController = TextEditingController();
  final estadoController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Crear materia'),
        ),
        body: Padding(
          padding: const EdgeInsets.all(20), // todos los margenes de 20
          child: Form(
              key: materiaForm, // crear un widget para formulario
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
                    controller: descripcionController,
                    decoration: const InputDecoration(
                        labelText: 'Descripcion'), // placeholder
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
                    controller: creditosController,
                    decoration: const InputDecoration(
                        labelText: 'Creditos'), // placeholder
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
                    controller: areaController,
                    decoration:
                        const InputDecoration(labelText: 'Area'), // placeholder
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
                    controller: estadoController,
                    decoration: const InputDecoration(
                        labelText: 'Estado'), // placeholder
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
                        Navigator.of(context).pushNamed('/vmateria');

                        insert();
                      },
                      child: const Text('Insertar Materia'))
                ],
              )),
        ));
  }

  insert() async {
    print('llegué a la funcion');
    if (materiaForm.currentState!.validate()) {
      materiaForm.currentState!.save(); //almacena el estado actual
      var data = Materia(
          name: nombreController.text,
          descripcion: descripcionController.text,
          creditos: creditosController.text,
          area: areaController.text,
          estado: estadoController.text); // crear instancia con la data
      //llamado a la funcion de insertar
      print(await DbConnection.insert('materia', data.toDictionary()));
    } // validando las cajas de texto
  }
}
