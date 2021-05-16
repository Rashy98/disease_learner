import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:disease_learner/Screens/Common/NavDrawer.dart';


class AddDiseases extends StatefulWidget{
  const AddDiseases({ Key key }) : super(key:key);

  @override
  _AddDiseasesState createState() => _AddDiseasesState();
}

class _AddDiseasesState extends State<AddDiseases>{
  String _TITLE = "Add Disease";
  final _formKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: NavDrawer(),
      appBar: AppBar(
        title: Text(_TITLE),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(
              margin: const EdgeInsets.only(top: 20),
              child: Align(
                alignment: Alignment.topCenter,
                child: Text('Add Disease'),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 50, left: 10),
              child: TextField(
                obscureText: true,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Add Disease'
                ),
              ),
            )
          ],
        ),
      )
    );
  }

}