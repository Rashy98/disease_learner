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
                        'Edit Disease',
                        style: TextStyle(fontWeight: FontWeight.bold, color:Color.fromRGBO(245, 229, 186, 1), fontSize: 20),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 20),
                      child: TextFormField(
                        style: TextStyle(color: Colors.white),
                        initialValue:widget.disease_name,
                        decoration: InputDecoration(labelText: widget.disease_name,
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
                        onSaved: (val) => setState(() => _editDisease.disease_name = val),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 20),
                      child: TextFormField(
                        style: TextStyle(color: Colors.white),
                        keyboardType: TextInputType.multiline,
                        maxLines: 5,
                        initialValue:widget.description,
                        decoration: InputDecoration(labelText: widget.description,
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
                        onSaved: (val) => setState(() => _editDisease.description = val),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 20),
                      child: TextFormField(
                        style: TextStyle(color: Colors.white),
                        keyboardType: TextInputType.multiline,
                        maxLines: 3,
                        initialValue: widget.symptoms,
                        decoration: InputDecoration(labelText: widget.symptoms,
                          labelStyle: TextStyle(color:Color.fromRGBO(245, 229, 186, 1)),
                          border: OutlineInputBorder(),
                          enabledBorder: const OutlineInputBorder(borderSide: BorderSide(color: Color.fromRGBO(245, 229, 186, 1))),
                          focusedBorder: const OutlineInputBorder(borderSide: BorderSide(color: Color.fromRGBO(245, 229, 186, 1))),),
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
                      margin: EdgeInsets.only(top: 20),
                      child: TextFormField(
                        style: TextStyle(color: Colors.white),
                        keyboardType: TextInputType.multiline,
                        maxLines: 3,
                        initialValue: widget.medication,
                        decoration: InputDecoration(labelText: widget.medication,
                          labelStyle: TextStyle(color:Color.fromRGBO(245, 229, 186, 1)),
                          border: OutlineInputBorder(),
                          enabledBorder: const OutlineInputBorder(borderSide: BorderSide(color: Color.fromRGBO(245, 229, 186, 1))),
                          focusedBorder: const OutlineInputBorder(borderSide: BorderSide(color: Color.fromRGBO(245, 229, 186, 1))),),
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
                        color: Color.fromRGBO(245, 229, 186, 1),
                        onPressed: (){
                          final form = _formKey.currentState;
                          if(form.validate()){
                            form.save();

                            var res = SQLiteDbProvider.db.update(_editDisease);
                            //print(_editDisease);
                            _showDialog(context);
                            form.reset();
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