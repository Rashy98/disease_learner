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
        title: Text(_TITLE),
      ),
      body: SingleChildScrollView(
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("lib/assets/images/back.jpg"),
              fit: BoxFit.cover,
            ),
          ),
          padding: const EdgeInsets.symmetric(vertical: 40.0, horizontal: 16.0),
          child: Builder(
            builder: (context) => Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Align(
                    alignment: Alignment.topCenter,
                    child: Text(
                      'Add Disease',
                      style: TextStyle(fontWeight: FontWeight.bold, color:Color.fromRGBO(245, 229, 186, 1), fontSize: 20),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 20),
                    child: TextFormField(
                      style: TextStyle(color: Colors.white),
                      decoration: InputDecoration(labelText: 'Disease Name',
                        labelStyle: TextStyle(color:Color.fromRGBO(245, 229, 186, 1)),
                        border: OutlineInputBorder(),
                        enabledBorder: const OutlineInputBorder(borderSide: BorderSide(color: Color.fromRGBO(245, 229, 186, 1))) ,
                        focusedBorder: const OutlineInputBorder(borderSide: BorderSide(color: Color.fromRGBO(245, 229, 186, 1))),),
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
                    margin: EdgeInsets.only(top: 20),
                    child: TextFormField(
                      style: TextStyle(color: Colors.white),
                      keyboardType: TextInputType.multiline,
                      maxLines: 5,
                      decoration: InputDecoration(labelText: 'Description',
                        labelStyle: TextStyle(color:Color.fromRGBO(245, 229, 186, 1)),
                        border: OutlineInputBorder(),
                        enabledBorder: const OutlineInputBorder(borderSide: BorderSide(color: Color.fromRGBO(245, 229, 186, 1))),
                        focusedBorder: const OutlineInputBorder(borderSide: BorderSide(color: Color.fromRGBO(245, 229, 186, 1))),
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
                    margin: EdgeInsets.only(top: 20),
                    child: TextFormField(
                      style: TextStyle(color: Colors.white),
                      keyboardType: TextInputType.multiline,
                      maxLines: 3,
                      decoration: InputDecoration(labelText: 'Symptoms',
                        labelStyle: TextStyle(color:Color.fromRGBO(245, 229, 186, 1)),
                        border: OutlineInputBorder(),
                        enabledBorder: const OutlineInputBorder(borderSide: BorderSide(color: Color.fromRGBO(245, 229, 186, 1))),
                        focusedBorder: const OutlineInputBorder(borderSide: BorderSide(color: Color.fromRGBO(245, 229, 186, 1))),),
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
                    margin: EdgeInsets.only(top: 20),
                    child: TextFormField(
                      style: TextStyle(color: Colors.white),
                      keyboardType: TextInputType.multiline,
                      maxLines: 3,
                      decoration: InputDecoration(labelText: 'Medication',
                        labelStyle: TextStyle(color:Color.fromRGBO(245, 229, 186, 1)),
                        border: OutlineInputBorder(),
                        enabledBorder: const OutlineInputBorder(borderSide: BorderSide(color: Color.fromRGBO(245, 229, 186, 1))),
                        focusedBorder: const OutlineInputBorder(borderSide: BorderSide(color: Color.fromRGBO(245, 229, 186, 1))),),
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
                    padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 16.0),
                    child: RaisedButton(
                      color: Color.fromRGBO(245, 229, 186, 1),
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
                      child: Text('Save'),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      )
    );
  }

  _showDialog(BuildContext context) {
    Scaffold.of(context)
        .showSnackBar(SnackBar(content: Text('Disease added')));
  }

}