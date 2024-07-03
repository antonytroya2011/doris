import 'package:practica2/settings/db_connection.dart';

class Student {
  int? id;
  String name;
  String lastName;

  Student(
      { //crear constructor
      this.id, //parametro id es opcional
      required this.name, // parametro name es requerido
      required this.lastName // parametro lastName es requerido
      });

  factory Student.fromDictionary(Map<String, dynamic> data) => Student(
      id: data['id'], // extraer id de data
      name: data['name'], // extraer name de data
      lastName: data['last_name'] // extraer last_name de data
      );

//enviar datos a la base de datos
  Map<String, dynamic> toDictionary() => {
        //crear funcion para pase de clase a diccionario
        //estooo se utiliza al momento de registrar datos{insert, update}
        //no acepta nadad como argumento
        'id': id, // asignar el  de id a diccionario
        'name': name, // asignar el name a diccionario
        'last_name': lastName, //asignar el last a diccionario
      };
  static Future<List<Student>> select() async {
    var data = await DbConnection.list("estudiante");
    if (data.isEmpty) {
      return List.empty();
    } else {
      return List.generate(
          data.length, (index) => Student.fromDictionary(data[index]));
    }
  }
}
