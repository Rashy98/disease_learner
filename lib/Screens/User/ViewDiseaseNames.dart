
import 'package:disease_learner/Screens/Common/NavDrawer.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:disease_learner/Screens/DBConnection/Database.dart';
import 'package:disease_learner/Screens/User/DetailedView.dart';


class ViewDiseaseNames extends StatefulWidget{
  const ViewDiseaseNames({ Key key }) : super(key:key);

  @override
  ViewDiseaseNamesList createState() => ViewDiseaseNamesList();


}


class ViewDiseaseNamesList extends State<ViewDiseaseNames>{
  var isLoading = true;

  List list;
  List diseaseList= [];
  List<Widget> listArray = [];
  getData() async{

     list= await SQLiteDbProvider.db.getAllDiseases();


  }



  makeListView(){
    getData();
    if(list != null) {
      list.forEach((element) {
        listArray.add(new Container(
            decoration: BoxDecoration(color: Color.fromRGBO(35, 57, 97, 1),borderRadius: BorderRadius.circular(5)),
            margin: const EdgeInsets.only(bottom: 10.0),
            child:new ListTile(
          contentPadding:
          EdgeInsets.symmetric(horizontal: 20.0, vertical: 5.0,),
          leading: Container(
            padding: EdgeInsets.only(right: 12.0),
            decoration: new BoxDecoration(
                border: new Border(
                    right: new BorderSide(width: 1.0, color: Colors.white24))),
            child: Icon(Icons.healing, color: Colors.white),
          ),
          title: Text(element.disease_name,
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ),

          subtitle: Row(
            children: <Widget>[
              Expanded(
                  flex: 1,
                  child: Container(
                    // tag: 'hero',
                    child: LinearProgressIndicator(
                        backgroundColor: Color.fromRGBO(200, 224, 224, 0.2),
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

      Navigator.push(
          context, MaterialPageRoute(builder: (context) => DetailPage(disease_name: element.disease_name,description: element.description,symptoms: element.symptoms,medication: element.medication,)));
//          context, MaterialPageRoute(builder: (context) => DetailPage(diseases.toMap()['disease_name'].toString(),diseases.toMap()['description'].toString(),diseases.toMap()['symptoms'].toString(),diseases.toMap()['medication'].toString())));
          },
        )));
      setState(() {
        isLoading = false;
      });
    }
      );
  }
      }


  @override
  Widget build(BuildContext context) {
    makeListView();
    // TODO: implement build
    return Scaffold(
      drawer: NavDrawer(),
        appBar: AppBar(
          flexibleSpace: Container(
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: <Color>[
                      Color.fromRGBO(90, 125, 164, 1),
                      Color.fromRGBO(35, 57, 97, 1),
                    ])
            ),
          ),
//          title: Text(_TITLE,style: TextStyle(fontSize: 12),),
        ),

        body: Container(
            margin: const EdgeInsets.only(top: 0),
            padding: EdgeInsets.symmetric(horizontal: 0),
            child: SingleChildScrollView(
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        decoration: new BoxDecoration(
//                   border: Border.all(color: Colors.red),
                          borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(50.0),
                              bottomRight: Radius.circular(50.0)),
                          gradient: new LinearGradient(
                              colors: [
                                Color.fromRGBO(90, 125, 164, 1),
                                Color.fromRGBO(35, 57, 97, 1),
                              ],
                              begin: const FractionalOffset(0.0, 0.0),
                              end: const FractionalOffset(1.0, 0.0),
                              stops: [0.0, 1.0],
                              tileMode: TileMode.clamp),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                  height: 100,
                                  width: 412,
                                  decoration: BoxDecoration(
//                        border: Border.all(color: Colors.red),
                                      borderRadius: BorderRadius.only(
                                          bottomLeft: Radius.circular(20.0),
                                          bottomRight: Radius.circular(20.0)),
                                      boxShadow: [
//                          BoxShadow(color:  Colors.red)
                                      ]
                                  ),
                                  child: Center(
                                      child: Text('Diseases', style: TextStyle(
                                          color: Colors.white, fontSize: 40),
                                        textAlign: TextAlign.center,)
                                  )
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 50,
                      ),

//                      Column(
//                        children: isLoading ?[CircularProgressIndicator()]:[
//                          ListView(
//                            children: listArray
//                            ,
//                          )
//                        ],
//                      ),
                      Card(
                        child: Column(
                            children: isLoading? [CircularProgressIndicator()]:listArray
//                            listArray
                        ),
                      ),

                      SizedBox(
                        height: 20,
                      ),
                    ]
                )
            )
        )
      );

  }



}