import 'package:disease_learner/Screens/DBConnection/Database.dart';

class DiseaseModel{

  /** These variables hold user inputs **/
  int id;
  String disease_name = '';
  String description = '';
  String symptoms = '';
  String medication = '';

  /** Holds the columns of the DB table **/
  static final columns = ["id", "disease_name", "description", "symptoms", "medication"];

  Map<String, dynamic> toMap() => {
    "id": id,
    "disease_name": disease_name,
    "description": description,
    "symptoms": symptoms,
    "medication": medication
  };


  save() async {
    // print('Disease $disease_name saved' );
    // print(SQLiteDbProvider.db.getAllDiseases());

    List list = await SQLiteDbProvider.db.getAllDiseases();

    list.forEach((element) {
      print(element.id);
      print(element.disease_name);
      print(element.description);
      print(element.symptoms);
      print(element.medication);
    });
  }


}