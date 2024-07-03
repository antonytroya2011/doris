import 'package:practica2/settings/db_connection.dart';

class Materia {
  int? id;
  String name;
  String descripcion;
  String creditos;
  String area;
  String estado;

  Materia(
      { //crear constructor
      this.id, //parametro id es opcional
      required this.name, // parametro name es requerido
      required this.descripcion, // parametro descripcion es requerido
      required this.creditos,
      required this.area,
      required this.estado});

  factory Materia.fromDictionary(Map<String, dynamic> data) => Materia(
      id: data['id'], // extraer id de data
      name: data['name'], // extraer name de data
      descripcion: data['descripcion'], // extraer descripcion de data
      creditos: data['creditos'],
      area: data['area'],
      estado: data['estado']);

//enviar datos a la base de datos
  Map<String, dynamic> toDictionary() => {
        //crear funcion para pase de clase a diccionario
        //estooo se utiliza al momento de registrar datos{insert, update}
        //no acepta nadad como argumento
        'id': id, // asignar el  de id a diccionario
        'name': name, // asignar el name a diccionario
        'descripcion': descripcion, //asignar descripcion a diccionario
        'creditos': creditos,
        'area': area,
        'estado': estado,
      };
  static Future<List<Materia>> select() async {
    var data = await DbConnection.list("materia");
    if (data.isEmpty) {
      return List.empty();
    } else {
      return List.generate(
          data.length, (index) => Materia.fromDictionary(data[index]));
    }
  }
}
