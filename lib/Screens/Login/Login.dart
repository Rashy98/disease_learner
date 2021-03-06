import 'package:disease_learner/Screens/Admin/ViewDiseaseList.dart';
import 'package:disease_learner/Screens/Login/Register.dart';
import 'package:flutter/material.dart';
import 'package:disease_learner/Screens/Models/User.Model.dart';
import 'package:disease_learner/Screens/DBConnection/Database.dart';
import 'package:disease_learner/Screens/User/ViewDiseaseNames.dart';
import 'package:disease_learner/Screens/Admin/AddDiseases.dart';
import 'package:shared_preferences/shared_preferences.dart';

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
        title: Text("Disease Learner"),
        automaticallyImplyLeading: false,


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
                padding: EdgeInsets.symmetric(vertical: 90),
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage("lib/assets/images/login.jpg"),
                    fit: BoxFit.contain,

                  ),
                ),
               // margin: const EdgeInsets.only(top: 0),
               // padding: EdgeInsets.symmetric(horizontal: 0),
                child: SingleChildScrollView(
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
//                          Container(
//                            decoration: new BoxDecoration(
//                              borderRadius: BorderRadius.only(
//                                  bottomLeft: Radius.circular(50.0),
//                                  bottomRight: Radius.circular(50.0)),
//                              gradient: new LinearGradient(
//                                  colors: [
//                                    Color.fromRGBO(9, 125, 164, 1),
//                                    Color.fromRGBO(35, 57, 97, 1),
//                                  ],
//                                  begin: const FractionalOffset(0.0, 0.0),
//                                  end: const FractionalOffset(1.0, 0.0),
//                                  stops: [0.0, 1.0],
//                                  tileMode: TileMode.clamp),
//                            ),
//                            child: Padding(
//                              padding: const EdgeInsets.all(0),
//                              child: Column(
//                                mainAxisAlignment: MainAxisAlignment.start,
//                                crossAxisAlignment: CrossAxisAlignment.start,
//                                children: [
//                                  Container(
//                                      height: 100,
//                                      width: 412,
//                                      decoration: BoxDecoration(
//                                          borderRadius: BorderRadius.only(
//                                              bottomLeft: Radius.circular(20.0),
//                                              bottomRight: Radius.circular(20.0)),
//                                          boxShadow: [
//                                          ]
//                                      ),
//                                      child: Center(
//                                          child: Text(_TITLE, style: TextStyle(
//                                              color: Colors.white, fontSize: 30),
//                                            textAlign: TextAlign.center,)
//                                      )
//                                  ),
//                                ],
//                              ),
//                            ),
//                          ),


                          Container(
                            decoration: BoxDecoration(

                            ),
                            margin: EdgeInsets.only(top: 120, bottom: 180),
                            padding: const EdgeInsets.symmetric(vertical: 40.0, horizontal: 16.0),
                            child: Builder(
                              builder: (context) => Form(
                                key: _formKey,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.stretch,
                                  children: [

                                    Container(
                                      decoration: BoxDecoration(

//                                         borderRadius: BorderRadius.circular(20),
//                                         border: Border.all(
//                                            width: 1, color: Colors.black, style: BorderStyle.solid)),

                                        borderRadius: BorderRadius.circular(20),
//                                        gradient: new LinearGradient(
//                                            colors: [
//
//                                              Color.fromRGBO(245, 255, 255, 0.9),
//                                              Color.fromRGBO(245, 255, 255, 0.9),
//                                            ],
//                                            begin: const FractionalOffset(0.0, 0.0),
//                                            end: const FractionalOffset(1.0, 0.0),
//                                            stops: [0.0, 0.0],
//                                            tileMode: TileMode.clamp),
                                      ),
                                      //margin: EdgeInsets.only(top: 10),
                                      child: TextFormField(
                                        style: TextStyle(color: Colors.black),
                                        decoration: InputDecoration(labelText: 'Username',
                                          labelStyle: TextStyle(color:Color.fromRGBO(30, 57, 97, 1),fontSize: 18),
                                          border: OutlineInputBorder(
                                              borderRadius: BorderRadius.circular(20),

                                          ),
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
                                        borderRadius: BorderRadius.circular(20),
//                                        gradient: new LinearGradient(
//                                            colors: [
////                            Color.fromRGBO(30, 57, 97, 0.9),
//                                              Color.fromRGBO(245, 229, 186, 0.9),
//                                              Color.fromRGBO(245, 255, 255, 0.9),
//
//                                            ],
//                                            begin: const FractionalOffset(0.0, 0.0),
//                                            end: const FractionalOffset(1.0, 0.0),
//                                            stops: [0.0, 1.0],
//                                            tileMode: TileMode.clamp),
                                      ),
                                      margin: EdgeInsets.only(top: 20),
                                      child: TextFormField(
                                        obscureText: true,
                                        style: TextStyle(color: Colors.black),
                                        decoration: InputDecoration(labelText: 'Password',
                                          labelStyle: TextStyle(color:Color.fromRGBO(30, 57, 97, 1),fontSize: 18),
                                          border: OutlineInputBorder(
                                            borderRadius: BorderRadius.circular(20),
                                          ),

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
//                                    Container(
//                                      padding: const EdgeInsets.symmetric(vertical: 0.0, horizontal: 16.0),
//                                    ),

                                    Container(
                                      margin: const EdgeInsets.only(top: 10),
                                      padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 16.0),
                                      child: RaisedButton(
                                        textColor: Colors.white,
                                        color: Color.fromRGBO(9, 125, 164, 1),
                                        shape: RoundedRectangleBorder(borderRadius: new BorderRadius.circular(30.0)),
                                        padding: EdgeInsets.all(8),
                                        onPressed: (){
                                          final form = _formKey.currentState;
                                          if(form.validate()){
                                            form.save();

                                            SQLiteDbProvider.db.getUserbyEmail(_user.email, _user.password)
                                              .then((value) => _handleLogin(value, context)
                                            );
                                            SQLiteDbProvider.db.getAllUsers();
                                            _showDialog(context);
                                            form.reset();
                                          }
                                        },
                                        child: Text('Login',style: TextStyle(fontSize: 24),),
                                      ),
                                    ),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: <Widget>[
                                        Text(
                                          'New to Disease Learner ?',
                                          style: TextStyle(fontFamily: 'Montserrat'),
                                        ),
                                        SizedBox(width: 5.0),
                                        InkWell(
                                          onTap: () {
                                            Navigator.pop(context);
                                            Navigator.push(
                                                context, MaterialPageRoute(builder: (context) => RegisterPage())
                                            );
                                          },
                                          child: Text(
                                            'Register',
                                            style: TextStyle(
                                                color: Color.fromARGB(255, 255, 255, 255),
                                                fontFamily: 'Montserrat',
                                                fontWeight: FontWeight.bold,
                                                decoration: TextDecoration.underline),
                                          ),
                                        )
                                      ],
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

  _handleLogin(bool state, BuildContext context) async{
    final token = await SharedPreferences.getInstance();
    final name = token.getString("Name");
    print(name);

    if (state){
      if(name == "Admin"){
        Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => ViewDiseaseList())
        );
      }
      else {
        Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => ViewDiseaseNames())
        );
      }
    }
  }

  _showDialog(BuildContext context) {
    Scaffold.of(context)
        .showSnackBar(SnackBar(content: Text('Login Failed')));
  }

}