import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:disease_learner/Screens/Common/NavDrawer.dart';
import 'package:disease_learner/Screens/Models/Disease.Model.dart';
import 'package:disease_learner/Screens/DBConnection/Database.dart';


class AddDiseases extends StatefulWidget{
  const AddDiseases({ Key key }) : super(key:key);

  @override
  _AddDiseasesState createState() => _AddDiseasesState();
}

class _AddDiseasesState extends State<AddDiseases>{

  String _TITLE = "Add Disease";

  final _formKey = GlobalKey<FormState>();
  final _addDisease = DiseaseModel();

  @override
  Widget build(BuildContext context) {
    _addDisease.save();
    return Scaffold(
      drawer: NavDrawer(),
        appBar: AppBar(
          flexibleSpace: Container(
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: <Color>[
                      Color.fromRGBO(9, 125, 164, 1),
                      Color.fromRGBO(35, 57, 97, 1),
                    ])
            ),
          ),
//          title: Text(_TITLE,style: TextStyle(fontSize: 12),),
        ),

        body: SingleChildScrollView(
        child: Container(
            decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("lib/assets/images/detail.jpg"),
              fit: BoxFit.cover,
            ),
            ),
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
                Color.fromRGBO(9, 125, 164, 1),
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
                        child: Text(_TITLE, style: TextStyle(
                            color: Colors.white, fontSize: 30),
                          textAlign: TextAlign.center,)
                    )
                ),
              ],
            ),
          ),
        ),

        Container(
          decoration: BoxDecoration(
//            image: DecorationImage(
//              image: AssetImage("lib/assets/images/detail.jpg"),
//              fit: BoxFit.cover,
//            ),
          ),
          padding: const EdgeInsets.symmetric(vertical: 40.0, horizontal: 16.0),
          child: Builder(
            builder: (context) => Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [

                  Container(
                    decoration: BoxDecoration(

                      borderRadius: BorderRadius.circular(5),
                      gradient: new LinearGradient(
                          colors: [

                            Color.fromRGBO(245, 229, 186, 0.9),
                            Color.fromRGBO(245, 255, 255, 0.9),
                          

                          ],
                          begin: const FractionalOffset(0.0, 0.0),
                          end: const FractionalOffset(1.0, 0.0),
                          stops: [0.0, 1.0],
                          tileMode: TileMode.clamp),
                    ),
                    margin: EdgeInsets.only(top: 10),
                    child: TextFormField(
                      style: TextStyle(color: Colors.white),
                      decoration: InputDecoration(labelText: 'Disease Name',
                        labelStyle: TextStyle(color:Color.fromRGBO(30, 57, 97, 1),fontSize: 18),
                        border: OutlineInputBorder(),
                      ),
                      validator: (value){
                        if (value.isEmpty){
                          return 'Please enter disease name';
                        }
                        return null;
                      },
                      onSaved: (val) => setState(() => _addDisease.disease_name = val),
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      gradient: new LinearGradient(
                          colors: [
//                            Color.fromRGBO(30, 57, 97, 0.9),
                            Color.fromRGBO(245, 229, 186, 0.9),
                            Color.fromRGBO(245, 255, 255, 0.9),

                          ],
                          begin: const FractionalOffset(0.0, 0.0),
                          end: const FractionalOffset(1.0, 0.0),
                          stops: [0.0, 1.0],
                          tileMode: TileMode.clamp),
                    ),
                    margin: EdgeInsets.only(top: 20),
                    child: TextFormField(
                      style: TextStyle(color: Colors.white),
                      keyboardType: TextInputType.multiline,
                      maxLines: 5,
                      decoration: InputDecoration(labelText: 'Description',
                        labelStyle: TextStyle(color:Color.fromRGBO(30, 57, 97, 1),fontSize: 18),
                        border: OutlineInputBorder(),

                      ),
                      validator: (value){
                        if (value.isEmpty){
                          return 'Please enter description';
                        }
                        return null;
                      },
                      onSaved: (val) => setState(() => _addDisease.description = val),
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      gradient: new LinearGradient(
                          colors: [
                            Color.fromRGBO(245, 229, 186, 0.9),
                            Color.fromRGBO(245, 255, 255, 0.9),
                          ],
                          begin: const FractionalOffset(0.0, 0.0),
                          end: const FractionalOffset(1.0, 0.0),
                          stops: [0.0, 1.0],
                          tileMode: TileMode.clamp),
                    ),
                    
                    margin: EdgeInsets.only(top: 20),
                    child: TextFormField(
                      style: TextStyle(color: Colors.white),
                      keyboardType: TextInputType.multiline,
                      maxLines: 3,
                      decoration: InputDecoration(labelText: 'Symptoms',
                        labelStyle: TextStyle(color:Color.fromRGBO(30, 57, 97, 1),fontSize: 18),
                        border: OutlineInputBorder(),
                      ),
                      validator: (value){
                        if (value.isEmpty){
                          return 'Please enter disease name';
                        }
                        return null;
                      },
                      onSaved: (val) => setState(() => _addDisease.symptoms = val),
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      gradient: new LinearGradient(
                          colors: [
                            Color.fromRGBO(245, 229, 186, 0.9),
                            Color.fromRGBO(245, 255, 255, 0.9),
                          ],
                          begin: const FractionalOffset(0.0, 0.0),
                          end: const FractionalOffset(1.0, 0.0),
                          stops: [0.0, 1.0],
                          tileMode: TileMode.clamp),
                    ),
                    margin: EdgeInsets.only(top: 20),
                    child: TextFormField(
                      style: TextStyle(color: Colors.white),
                      keyboardType: TextInputType.multiline,
                      maxLines: 3,
                      decoration: InputDecoration(labelText: 'Medication',
                        labelStyle: TextStyle(color:Color.fromRGBO(30, 57, 97, 1),fontSize: 18),
                        border: OutlineInputBorder(),
                        ),
                      validator: (value){
                        if (value.isEmpty){
                          return 'Please enter disease name';
                        }
                        return null;
                      },
                      onSaved: (val) => setState(() => _addDisease.medication = val),
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 16.0),
                    child: RaisedButton(
                      color: Color.fromRGBO(245, 229, 186, 0.9),
                      onPressed: (){
                        final form = _formKey.currentState;
                        if(form.validate()){
                          form.save();

                          var res = SQLiteDbProvider.db.insert(_addDisease);
                          _addDisease.save();
                          // print(res);
                          _showDialog(context);
                          form.reset();
                        }
                      },
                      child: Text('Save Disease',style: TextStyle(fontSize: 24),),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ]
    )
    )
    )
        )
    );
  }

  _showDialog(BuildContext context) {
    Scaffold.of(context)
        .showSnackBar(SnackBar(content: Text('Disease added')));
  }

}