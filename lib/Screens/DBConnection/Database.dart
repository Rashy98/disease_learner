import 'dart:async';
import 'dart:io';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sqflite/sqflite.dart';

/** Custom Model Clases **/
import 'package:disease_learner/Screens/Models/Disease.Model.dart';
import 'package:disease_learner/Screens/Models/User.Model.dart';


/** Singleton based DB provider class **/
class SQLiteDbProvider {
  SQLiteDbProvider._();

  static final SQLiteDbProvider db = SQLiteDbProvider._();
  static Database _database;

  Future<Database> get database async {
    if (_database != null) {
      return _database;
    }

    _database = await initDB();
    return _database;
  }

  initDB() async {
    Directory documentDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentDirectory.path, "Diseases.db");
    // await deleteDatabase(path);

    return await openDatabase(
        path,
        version: 1,
        onOpen: (db) {},
        onCreate: (Database db, int version) async {
          await db.execute(
              "CREATE TABLE DiseaseDetails("
                  "id INTEGER PRIMARY KEY,"
                  "disease_name TEXT,"
                  "description TEXT,"
                  "symptoms TEXT,"
                  "medication TEXT" ")"
          );
          await db.execute(
              "CREATE TABLE UserDetails("
                  "id INTEGER PRIMARY KEY,"
                  "email TEXT,"
                  "password TEXT,"
                  "first_name TEXT,"
                  "last_name TEXT" ")"
          );
        }
    );
  }
  
  /** Add new disease **/
  insert(DiseaseModel diseaseModel) async{

    final db = await database;
    var maxIdResult = await db.rawQuery("SELECT MAX(id)+1 as last_inserted_id FROM DiseaseDetails");

    var id = maxIdResult.first["last_inserted_id"];
    diseaseModel.id = id;

    var result = await db.insert('DiseaseDetails', diseaseModel.toMap(), conflictAlgorithm: ConflictAlgorithm.abort);

    return result;
  }

  /** Get all diseases **/
  Future<List<DiseaseModel>> getAllDiseases() async{
    final db = await database;
    List<Map<String, dynamic>> results = await db.query("DiseaseDetails", columns: DiseaseModel.columns, orderBy: "id ASC");

    return List.generate(results.length, (index) {
      final _diseaseModel = DiseaseModel();

      _diseaseModel.id = results[index]['id'];
      _diseaseModel.disease_name = results[index]['disease_name'];
      _diseaseModel.description = results[index]['description'];
      _diseaseModel.symptoms = results[index]['symptoms'];
      _diseaseModel.medication = results[index]['medication'];

      return _diseaseModel;
    });

  }
  addUser(UserModel userModel) async{

    final db = await database;
    var maxIdResult = await db.rawQuery("SELECT MAX(id)+1 as last_inserted_id FROM UserDetails");

    var id = maxIdResult.first["last_inserted_id"];
    userModel.id = id;

    var result = await db.insert('UserDetails', userModel.toMap(), conflictAlgorithm: ConflictAlgorithm.abort);

    return result;
  }
  Future <bool> getUserbyEmail (String email, String password) async {

    final db = await database;
    var result = await db.query("UserDetails", where: "email = ?", whereArgs: [email]);

    print(result.first);
    if(result.isNotEmpty){
      if(result.first['password'] == password){
        final token = await SharedPreferences.getInstance();
        token.setString('Name', result.first['first_name']);
        return true;
      }
    }
    // result.isNotEmpty?  print(result.first['password']): print("empty");
    return false;

  }

  Future<List<UserModel>> getAllUsers() async{
    final db = await database;
    List<Map<String, dynamic>> results = await db.query("UserDetails", columns: UserModel.columns, orderBy: "id ASC");

    List.generate(results.length, (index) {
      print(results[index]['email']);
    });

  }
}

