import 'package:practica2/settings/db_connection.dart';

class Docente {
  int? id;
  String name;
  String last_name;
  String direccion;
  String telefono;
  String especialidad;

  Docente(
      { //crear constructor
      this.id, //parametro id es opcional
      required this.name, // parametro name es requerido
      required this.last_name,
      required this.direccion, // parametro dirección es requerido
      required this.telefono,
      required this.especialidad});

  factory Docente.fromDictionary(Map<String, dynamic> data) => Docente(
      id: data['id'], // extraer id de data
      name: data['name'], // extraer name de data
      last_name: data['last_name'], // extraer last_name de data
      direccion: data['direccion'],
      telefono: data['telefono'],
      especialidad: data['especialidad']);

//enviar datos a la base de datos
  Map<String, dynamic> toDictionary() => {
        //crear funcion para pase de clase a diccionario
        //estooo se utiliza al momento de registrar datos{insert, update}
        //no acepta nadad como argumento
        'id': id, // asignar el  de id a diccionario
        'name': name, // asignar el name a diccionario
        'last_name': last_name, //asignar el last_name a diccionario
        'direccion': direccion,
        'telefono': telefono,
        'especialidad': especialidad,
      };
  static Future<List<Docente>> select() async {
    var data = await DbConnection.list("docente");
    if (data.isEmpty) {
      return List.empty();
    } else {
      return List.generate(
          data.length, (index) => Docente.fromDictionary(data[index]));
    }
  }
}
