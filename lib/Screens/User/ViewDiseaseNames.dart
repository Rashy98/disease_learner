
import 'package:disease_learner/Screens/Common/NavDrawer.dart';
import 'package:disease_learner/Screens/Models/Disease.Model.dart';
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
//     if(list.length != 0) {

//     }

  }

  makeListView(){
    getData();
    if(list != null) {
      list.forEach((element) {
        listArray.add(new ListTile(
          title: Text(element.disease_name),
          onTap: (){
         Navigator.push(
             context, MaterialPageRoute(builder: (context) => DetailPage(disease_name: element.disease_name,description: element.description,symptoms: element.symptoms,medication: element.medication,)));
             },
          trailing: Icon(Icons.keyboard_arrow_right),
        )
        );
//       diseaseList.add(element.disease_name);
//       print(element.disease_name);

      }
      );
      setState(() {
        isLoading = false;
      });
    }
  }

  String _TITLE = 'View Diseases';
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
                      Card(
                        child: Column(
                            children: isLoading? [CircularProgressIndicator()]:listArray
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