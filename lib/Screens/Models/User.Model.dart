import 'package:disease_learner/Screens/DBConnection/Database.dart';

class UserModel{

  /** These variables hold user inputs **/
  int id;
  String email = '';
  String password = '';
  String first_name = '';
  String last_name = '';

  /** Holds the columns of the DB table **/
  static final columns = ["id", "email", "password", "first_name", "last_name"];

  Map<String, dynamic> toMap() => {
    "id": id,
    "email": email,
    "password": password,
    "first_name": first_name,
    "last_name": last_name
  };


//  save() async {
//    // print('Disease $disease_name saved' );
//    // print(SQLiteDbProvider.db.getAllDiseases());
//
//    List list = await SQLiteDbProvider.db.getAllUsers();
//
//    list.forEach((element) {
//      print(element.id);
//      print(element.email);
//      print(element.password);
//      print(element.first_name);
//      print(element.last_name);
//    });
//  }


}