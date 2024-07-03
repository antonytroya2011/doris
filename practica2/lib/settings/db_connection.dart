import 'package:path/path.dart'; // importar libreria path
import 'package:sqflite/sqflite.dart'; //impttar la libreri de sqlite

class DbConnection {
  static const version = 1; // version de conexion por default va 1 siempre
  static const dbName = 'octavo_utc.db'; // nombre de la base de datos sqlite

  //metodo de conexion
  static Future<Database> getConection() async {
    // declarar una funcion asincrona llamada getConeccion
    return openDatabase(
        join(
            //concatenar la ruta absoluta, con el nombre de la base de datos
            await getDatabasesPath(), // llamar a funcion asincrona que contiene la ruta de base de datos estandar
            dbName //nombre de la basse de datos en este caso es octavo_utc.db
            ),
        onCreate: (db, version) async => {
              //evento para crear la base de datos
              //primer parametro  es un alias que se designa a la base de datos
              //segundo parametro hace referencia a la version que etsa en la linea 5
              // en esta funcion se crea tablas o datos iniciales
              await db.execute(
                  "CREATE TABLE estudiante (id INTEGER PRIMARY KEY,name TEXT,last_name TEXT)"),
              //creacion de tablas estudiante  con lenguaje sql utilizando el metodo  execute
              await db.execute(
                  "INSERT INTO estudiante VALUES(1,'Doris', 'Farinango')"),
              //creacion de un registro en la tabla estudiante

              //creación de nuevas tablas e inserción de datos
              await db.execute(
                  "CREATE TABLE materia (id INTEGER PRIMARY KEY,name TEXT,descripcion TEXT, creditos TEXT, area TEXT, estado TEXT)"),
              await db.execute(
                  "INSERT INTO materia VALUES(1,'Matematicas', 'fundamentos de algebra','4','Matematicas', 'Activa')"),

              await db.execute(
                  "CREATE TABLE carrera (id INTEGER PRIMARY KEY,name TEXT,duracion TEXT, titulo TEXT,facultad TEXT, plan_de_estudios TEXT)"),
              await db.execute(
                  "INSERT INTO carrera VALUES(1,'Sistemas', '8 semestres', 'Ingeniería','La Matriz','Opcional')"),

              await db.execute(
                  "CREATE TABLE docente (id INTEGER PRIMARY KEY,name TEXT,last_name TEXT, direccion TEXT, telefono TEXT, especialidad TEXT)"),
              await db.execute(
                  "INSERT INTO docente VALUES(1,'Pedro', 'Gomez', 'Latacunga', '0999644644', 'Matematicas')"),
            },
        version: version // version de la base de datos
        ); //abrir la conexion
  } //devuelve el tipo de dato llamdo Database

  static Future<int> insert(String table, dynamic data) async {
    //creacion del metodo insert
    //primer parametro nombre de la data
    //segundo parametro have refencia a la data
    final db = await getConection(); //llamado a la funcion de conexion
    return db.insert(table, data,
        conflictAlgorithm:
            ConflictAlgorithm.replace); //llamado a la funcion insert
    //paso los parametros de tabla y de data
  }

//actualizar
  static Future<int> update(String table, dynamic data, int id) async {
    final db = await getConection(); //llamado a la funcion de conexion
    return db.update(
        table, //nombre de la tabla
        data, // data a actualizar
        where: 'id = ?', //where del argumento que en este caso es el id
        whereArgs: [id] //llamado a la variable del id
        );
  }
  //eiminar

  static Future<int> delete(String table, int id) async {
    //crear funcion para eliminar
    //primer parametro es el nombre de la tabla
    //segundo parametro es el id del registro
    final db = await getConection(); // llamado de la funcion de conexion
    return db.delete(table, // nombre de la tabla
        where: 'id=?', //where de argumeno en este caso es el id
        whereArgs: [id] // llamado a la variable id que viene por parametro
        );
  }

  //leer
  static Future<List<Map<String, dynamic>>> list(String table) async {
    //funcion para listar datos de una tabla
    //primer parametro es nombre de la tabla
    //retorna una lista de diccionarios
    final db = await getConection(); //llamado a la funcion  de conexion
    return db.query(table); // llamado a la funcion de select
  }

  static Future<List<Map<String, dynamic>>> detail(
      String table, String where, dynamic args) async {
    //funcion para listar datos de una tabla
    //primer parametro es nombre de la tabla
    //segundo parametro es el filtro where
    //tercer perametro son los valores de los argumentos
    //retorna una lista de diccionarios
    final db = await getConection(); //llamado a la funcion  de conexion
    return db.query(table,
        where: where, whereArgs: args); // llamado a la funcion de select
  }
}
