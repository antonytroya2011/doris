import 'package:practica2/settings/db_connection.dart';

class Carrera {
  int? id;
  String name;
  String duracion;
  String titulo;
  String facultad;
  String plandeEstudios;

  Carrera(
      { //crear constructor
      this.id, //parametro id es opcional
      required this.name, // parametro name es requerido
      required this.duracion, // parametro duración es requerido
      required this.titulo,
      required this.facultad,
      required this.plandeEstudios});

  factory Carrera.fromDictionary(Map<String, dynamic> data) => Carrera(
      id: data['id'], // extraer id de data
      name: data['name'], // extraer name de data
      duracion: data['duracion'], // extraer duración de data
      titulo: data['titulo'],
      facultad: data['facultad'],
      plandeEstudios: data['plan_de_estudios']);

//enviar datos a la base de datos
  Map<String, dynamic> toDictionary() => {
        //crear funcion para pase de clase a diccionario
        //estooo se utiliza al momento de registrar datos{insert, update}
        //no acepta nadad como argumento
        'id': id, // asignar el  de id a diccionario
        'name': name, // asignar el name a diccionario
        'duracion': duracion, //asignar la duración a diccionario
        'titulo': titulo,
        'facultad': facultad,
        'plan_de_estudios': plandeEstudios,
      };
  static Future<List<Carrera>> select() async {
    var data = await DbConnection.list("carrera");
    if (data.isEmpty) {
      return List.empty();
    } else {
      return List.generate(
          data.length, (index) => Carrera.fromDictionary(data[index]));
    }
  }
}
