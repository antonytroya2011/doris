import 'package:flutter/material.dart'; // importar la libreria para el diseño de la interfaz

class Home extends StatelessWidget{
  const Home({super.key});

  @override

  Widget build (BuildContext){
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),//texto que se muestra
      ),//Declaro el widget AppBar //AppBar
      body: Center(child: Column(
        children: [
          const Text("Hola"),
          const Text("Esta es una prueba de column"),
          const Text("El contenido va de arriba hacia abajo"),
          Row(children: [
            Expanded(child: Container(
              color: Colors.green,
              child: const Text("Hola"))),
            Expanded(child: Container(
              color: Colors.blue,
              child: const Text("Esta es una prueba de row"))),
            Expanded(child: Container(
              color: Colors.yellow,
              child: const Text("ABC"))),
            Expanded(child: Container(
              color: Colors.red,
              child: const Text("Adios"))),
            
            //Text("El contenido va de izquierda a derecha"),
          ],)
        ],
      ),),
    );// contenedor principal
  }
}