import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:disease_learner/Screens/Common/NavDrawer.dart';
import 'package:disease_learner/Screens/Models/AddDisease.Model.dart';


class AddDiseases extends StatefulWidget{
  const AddDiseases({ Key key }) : super(key:key);

  @override
  _AddDiseasesState createState() => _AddDiseasesState();
}

class _AddDiseasesState extends State<AddDiseases>{

  String _TITLE = "Add Disease";

  final _formKey = GlobalKey<FormState>();
  final _addDisease = AddDiseaseModel();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: NavDrawer(),
      appBar: AppBar(
        title: Text(_TITLE),
      ),
      body: SingleChildScrollView(
        child: Container(
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
                      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 20),
                    child: TextFormField(
                      decoration: InputDecoration(labelText: 'Disease Name', border: OutlineInputBorder()),
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
                      keyboardType: TextInputType.multiline,
                      maxLines: 5,
                      decoration: InputDecoration(labelText: 'Description', border: OutlineInputBorder()),
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
                      keyboardType: TextInputType.multiline,
                      maxLines: 3,
                      decoration: InputDecoration(labelText: 'Symptoms', border: OutlineInputBorder()),
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
                      keyboardType: TextInputType.multiline,
                      maxLines: 3,
                      decoration: InputDecoration(labelText: 'Medication', border: OutlineInputBorder()),
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
                    child: ElevatedButton(
                      onPressed: (){
                        final form = _formKey.currentState;
                        if(form.validate()){
                          form.save();
                          _addDisease.save();
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
    ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar(content: Text('Disease added')));
  }

}