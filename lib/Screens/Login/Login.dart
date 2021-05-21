import 'package:flutter/material.dart';
import 'package:disease_learner/Screens/Models/User.Model.dart';
import 'package:disease_learner/Screens/DBConnection/Database.dart';
import 'package:disease_learner/Screens/User/ViewDiseaseNames.dart';

class Login extends StatefulWidget {
  const Login({Key key}) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login>{

  String _TITLE = "Login";

  final _formKey = GlobalKey<FormState>();
  final _user = UserModel();

  @override
  Widget build(BuildContext context) {

    return Scaffold(

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
                                          borderRadius: BorderRadius.only(
                                              bottomLeft: Radius.circular(20.0),
                                              bottomRight: Radius.circular(20.0)),
                                          boxShadow: [
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
                                        style: TextStyle(color: Colors.black),
                                        decoration: InputDecoration(labelText: 'Username',
                                          labelStyle: TextStyle(color:Color.fromRGBO(30, 57, 97, 1),fontSize: 18),
                                          border: OutlineInputBorder(),
                                        ),
                                        validator: (value){
                                          if (value.isEmpty){
                                            return 'Please enter username';
                                          }
                                          return null;
                                        },
                                        onSaved: (val) => setState(() => _user.email = val),
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
                                        style: TextStyle(color: Colors.black),
                                        decoration: InputDecoration(labelText: 'Password',
                                          labelStyle: TextStyle(color:Color.fromRGBO(30, 57, 97, 1),fontSize: 18),
                                          border: OutlineInputBorder(),

                                        ),
                                        validator: (value){
                                          if (value.isEmpty){
                                            return 'Please enter password';
                                          }
                                          return null;
                                        },
                                        onSaved: (val) => setState(() => _user.password = val),
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

                                            SQLiteDbProvider.db.getUserbyEmail(_user.email, _user.password)
                                              .then((value) => _handleLogin(value, context)
                                            );
                                            _showDialog(context);
                                            form.reset();
                                          }
                                        },
                                        child: Text('Login',style: TextStyle(fontSize: 24),),
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

  _handleLogin(bool state, BuildContext context){

    if (state){

      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => ViewDiseaseNames())
      );
    }
  }

  _showDialog(BuildContext context) {
    Scaffold.of(context)
        .showSnackBar(SnackBar(content: Text('Login Failed')));
  }

}