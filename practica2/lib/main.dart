import 'package:flutter/material.dart'; // importar la libreria para el diseño de la interfaz
import 'package:practica2/vcarrera.dart';
import 'package:practica2/vdocente.dart';
import 'package:practica2/vestudiante.dart';
import 'package:practica2/views/carrera/new.dart';
import 'package:practica2/views/docente/new.dart';
import 'package:practica2/home.dart';
import 'package:practica2/list.dart';
import 'package:practica2/views/materia/new.dart';
import 'package:practica2/views/student/new.dart';
import 'package:practica2/vmateria.dart';
import 'package:practica2/welcome.dart'; //importar la clase

void main() {
  //funcion principal de arranque del todo el proyecto
//solo se declara en el archivo main
  runApp(
      const MyApp()); //correr la aplicaion en la clase que señalamos ej.MyApp
}

//creo la clase principal llamada MyApp y genero una herencia de statelesswidget
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  //anotacion de que se va a escribir un codigo heredado
  @override
  //creamos un widget principal y generamos un contexto general
  Widget build(BuildContext context) {
    // parte de la configuracion de la interfaz de la libreria importada
    return MaterialApp(
      //se denomina las rutas para la navegacion de las interfaces (URL)
      initialRoute: '/welcome',
      //creamos un diccionario de rutas
      routes: {
        '/home': (context) =>
            const Home(), // creamos la ruta para la clase home
        '/welcome': (context) =>
            const Welcome(), // creamos la ruta para la clase welcome
        '/list': (context) => const Lista(),

        //rutas para administración de estudiantes
        '/student/create': (context) => const StudentCreate(),
        '/materia/create': (context) => const MateriaCreate(),
        '/carrera/create': (context) => const CarreraCreate(),
        '/docente/create': (context) => const DocenteCreate(),
        '/vestudiante': ((context) => const Estudiantes()),
        '/vdocente': ((context) => const Docentes()),
        '/vmateria': ((context) => const Materias()),
        '/vcarrera': ((context) => const Carreras())
      },
    );
  }
}
