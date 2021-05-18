
import 'package:disease_learner/Screens/DBConnection/Database.dart';
import 'package:disease_learner/Screens/Models/Disease.Model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ListPage extends StatefulWidget {

    const ListPage({ Key key }) : super(key:key);

    @override
    listDiseases createState() => listDiseases();

}


class listDiseases extends State<ListPage>{

  List<DiseaseModel> list;
  getData() async{
    list= await SQLiteDbProvider.db.getAllDiseases();


  }

  @override
  void initState() {
    getData();

    print(list.length);
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    print(list[0].toMap()['id']);
    return(
    list.length!= 0 ?

     Scaffold(
      body: Container(
        child:  makeCard(list[0])

      ),
    ) :
        Scaffold(
          body: Container(
            child: CircularProgressIndicator(),
          ),
        )
    );
  }

  Card makeCard(DiseaseModel diseases) => Card(
    elevation: 8.0,
    margin: new EdgeInsets.symmetric(horizontal: 10.0, vertical: 6.0),
    child: Container(
      decoration: BoxDecoration(color: Color.fromRGBO(64, 75, 96, .9)),
      child: makeListTile(diseases),
    ),
  );



  ListTile makeListTile(DiseaseModel diseases) => ListTile(
    contentPadding:
    EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
    leading: Container(
      padding: EdgeInsets.only(right: 12.0),
      decoration: new BoxDecoration(
          border: new Border(
              right: new BorderSide(width: 1.0, color: Colors.white24))),
      child: Icon(Icons.autorenew, color: Colors.white),
    ),
    title: Text(
      diseases.toMap()['disease_name'],
      style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
    ),


    subtitle: Row(
      children: <Widget>[
        Expanded(
            flex: 1,
            child: Container(
              // tag: 'hero',
              child: LinearProgressIndicator(
                  backgroundColor: Color.fromRGBO(209, 224, 224, 0.2),
                  value: 100,
                  valueColor: AlwaysStoppedAnimation(Colors.green)),
            )),
        Expanded(
          flex: 4,
          child: Padding(
              padding: EdgeInsets.only(left: 10.0),
              child: Text('Common',
                  style: TextStyle(color: Colors.white))),
        )
      ],
    ),
    trailing:
    Icon(Icons.keyboard_arrow_right, color: Colors.white, size: 30.0),
    onTap: () {

//      Navigator.push(
//          context, MaterialPageRoute(builder: (context) => DetailPage(diseases[0].toString(),diseases[1])));
    },
  );



}

