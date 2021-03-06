import 'package:disease_learner/Screens/Admin/ViewDiseaseList.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:disease_learner/Screens/Common/NavDrawer.dart';
import 'package:disease_learner/Screens/Models/Disease.Model.dart';
import 'package:disease_learner/Screens/DBConnection/Database.dart';


class EditDiseases extends StatefulWidget{
  const EditDiseases(this.id, this.disease_name,this.description,this.symptoms,this.medication, { Key key }) : super(key:key);
  final int id ;
  final String disease_name ;
  final String description;
  final String symptoms;
  final String medication;

  @override
  _EditDiseasesState createState() => _EditDiseasesState();
}

class _EditDiseasesState extends State<EditDiseases>{

  String _TITLE = "Edit Disease";

  final _formKey = GlobalKey<FormState>();
  final _editDisease = DiseaseModel();

  @override
  Widget build(BuildContext context) {
    _editDisease.save();
    _editDisease.id = widget.id;
    return Scaffold(
        drawer: NavDrawer(),
        appBar: AppBar(
          title: Text(_TITLE),
        ),
        body: SingleChildScrollView(
          child: Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage("lib/assets/images/mainBackground.jpg"),
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
                        'Edit Disease',
                        style: TextStyle(fontWeight: FontWeight.bold, color:Colors.black, fontSize: 20),
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
//
                      ),
                      margin: EdgeInsets.only(top: 20),
                      child: TextFormField(
                        style: TextStyle(color: Colors.black),
                        initialValue:widget.disease_name,
                        decoration: InputDecoration(labelText: "Disease Name",
                          labelStyle: TextStyle(color:Colors.black),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        validator: (value){
                          if (value.isEmpty){
                            return 'Please enter disease name';
                          }
                          return null;
                        },
                        onSaved: (val) => setState(() => _editDisease.disease_name = val),
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
//
                      ),
                      margin: EdgeInsets.only(top: 20),
                      child: TextFormField(
                        style: TextStyle(color: Colors.black),
                        keyboardType: TextInputType.multiline,
                        maxLines: 5,
                        initialValue:widget.description,
                        decoration: InputDecoration(labelText: "Description",
                          labelStyle: TextStyle(color:Colors.black),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                       ),
                        validator: (value){
                          if (value.isEmpty){
                            return 'Please enter description';
                          }
                          return null;
                        },
                        onSaved: (val) => setState(() => _editDisease.description = val),
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
//
                      ),
                      margin: EdgeInsets.only(top: 20),
                      child: TextFormField(
                        style: TextStyle(color: Colors.black),
                        keyboardType: TextInputType.multiline,
                        maxLines: 3,
                        initialValue: widget.symptoms,
                        decoration: InputDecoration(labelText: "Symptoms",
                          labelStyle: TextStyle(color:Colors.black),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          ),
                        validator: (value){
                          if (value.isEmpty){
                            return 'Please enter Symptoms';
                          }
                          return null;
                        },
                        onSaved: (val) => setState(() => _editDisease.symptoms = val),
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
//
                      ),
                      margin: EdgeInsets.only(top: 20),
                      child: TextFormField(
                        style: TextStyle(color: Colors.black),
                        keyboardType: TextInputType.multiline,
                        maxLines: 3,
                        initialValue: widget.medication,
                        decoration: InputDecoration(labelText: "Medications",
                          labelStyle: TextStyle(color:Colors.black),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          ),
                        validator: (value){
                          if (value.isEmpty){
                            return 'Please enter Medication';
                          }
                          return null;
                        },
                        onSaved: (val) => setState(() => _editDisease.medication = val),
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 16.0),
                      child: RaisedButton(
                        textColor: Colors.white,
                        color: Color.fromRGBO(35, 57, 97, 1),
                        shape: RoundedRectangleBorder(borderRadius: new BorderRadius.circular(30.0)),
                        padding: EdgeInsets.all(8),
                        onPressed: (){
                          final form = _formKey.currentState;
                          if(form.validate()){
                            form.save();

                            var res = SQLiteDbProvider.db.update(_editDisease);
                            //print(_editDisease);
                            _showDialog(context);
                            form.reset();
                            Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => ViewDiseaseList())
                            );
                          }
                        },
                        child: Text('Update'),
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
        .showSnackBar(SnackBar(content: Text('Disease Updated')));
  }

}