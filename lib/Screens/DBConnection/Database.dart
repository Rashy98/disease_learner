import 'dart:async';
import 'dart:io';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

/** Custom Model Clases **/
import 'package:disease_learner/Screens/Models/Disease.Model.dart';

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
}

