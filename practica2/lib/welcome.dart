 import 'package:flutter/material.dart';

class Welcome extends StatelessWidget{
  const Welcome({super.key});

  @override

  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(title: const Text("Sistema Ecolástico"),),
      body: Padding(
        padding: const EdgeInsets.all(20), //only:(top: 20 left: 20)
        child: Center(
          child: Column(
            children: [
              const Text("Bienvenidos"),
              Image.network('https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSGpIvQHp8g4GuGyrlIpswpa8Tw3KtnVyWdsw&s'),
              TextButton(onPressed: (){
                Navigator.of(context).pushNamed('/list');//navegar a otro ventana
              }, child: const Text("Ingresar Estudiante")),
              TextButton(onPressed: (){
                Navigator.of(context).pushNamed('/list');//navegar a otro ventana
              }, child: const Text("Ingresar Materia")),
              TextButton(onPressed: (){
                Navigator.of(context).pushNamed('/list');//navegar a otro ventana
              }, child: const Text("Ingresar Carrera")),
              TextButton(onPressed: (){
                Navigator.of(context).pushNamed('/list');//navegar a otro ventana
              }, child: const Text("Ingresar Docente"))
            ],
          ),
        ),
      ),
    );
  }
}