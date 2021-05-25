import 'dart:convert';
import 'dart:io';

import 'package:disease_learner/Screens/Login/Login.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:disease_learner/Screens/Models/User.Model.dart';
import 'package:disease_learner/Screens/DBConnection/Database.dart';


class RegisterPage extends StatefulWidget{

  @override
  _RegisterPageState createState() => _RegisterPageState();
}


class _RegisterPageState extends State <RegisterPage> {


final formKey = GlobalKey <FormState> ();
final user = UserModel ();

  @override
  Widget build(BuildContext context) {
    // SQLiteDbProvider.db.getUserbyEmail('nuwana24@gmail.com');

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


//        title: Text('TicketingApp'),

        ),

        body: SingleChildScrollView(

            child: Container(

                padding: EdgeInsets.symmetric(vertical: 97),
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage("lib/assets/images/signUp.jpg"),
                    fit: BoxFit.cover,
                  ),
                ),
                margin: const EdgeInsets.only(top: 0),
                //padding: EdgeInsets.symmetric(horizontal: 0),
                child: SingleChildScrollView(
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
//                          Container(
//                            decoration: new BoxDecoration(
////                   border: Border.all(color: Colors.red),
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
////                        border: Border.all(color: Colors.red),
//                                          borderRadius: BorderRadius.only(
//                                              bottomLeft: Radius.circular(20.0),
//                                              bottomRight: Radius.circular(20.0)),
//                                          boxShadow: [
////                          BoxShadow(color:  Colors.red)
//                                          ]
//                                      ),
//                                      child: Center(
//                                          child: Text("Sign Up", style: TextStyle(
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
//            image: DecorationImage(
//              image: AssetImage("lib/assets/images/detail.jpg"),
//              fit: BoxFit.cover,
//            ),
                            ),

                            padding: const EdgeInsets.symmetric(vertical: 40.0, horizontal: 16.0),
                            child: Builder(
                              builder: (context) => Form(
                                key: formKey,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.stretch,
                                  children: [

                                    Container(
                                      decoration: BoxDecoration(

                                        borderRadius: BorderRadius.circular(20),
//                                        gradient: new LinearGradient(
//                                            colors: [
//
//                                              Color.fromRGBO(245, 229, 186, 0.9),
//                                              Color.fromRGBO(245, 255, 255, 0.9),
//
//
//                                            ],
//                                            begin: const FractionalOffset(0.0, 0.0),
//                                            end: const FractionalOffset(1.0, 0.0),
//                                            stops: [0.0, 1.0],
//                                            tileMode: TileMode.clamp),
                                      ),
                                      margin: EdgeInsets.only(top: 10),
                                      child: TextFormField(
                                        style: TextStyle(color: Colors.white),
                                        decoration: InputDecoration(labelText: 'First Name',
                                          labelStyle: TextStyle(color:Color.fromRGBO(30, 57, 97, 1),fontSize: 18),
                                          border: OutlineInputBorder(
                                            borderRadius: BorderRadius.circular(20),
                                          ),
                                        ),
                                        validator: (value){
                                          if (value.isEmpty){
                                            return 'Please enter first name';
                                          }
                                          return null;
                                        },
                                        onSaved: (fname) => setState(() => user.first_name = fname),
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
                                        style: TextStyle(color: Colors.white),
                                        decoration: InputDecoration(labelText: 'Last Name',
                                          labelStyle: TextStyle(color:Color.fromRGBO(30, 57, 97, 1),fontSize: 18),
                                          border: OutlineInputBorder(
                                            borderRadius: BorderRadius.circular(20),
                                          ),

                                        ),
                                        validator: (value){
                                          if (value.isEmpty){
                                            return 'Please enter Last Name';
                                          }
                                          return null;
                                        },
                                        onSaved: (lname) => setState(() => user.last_name = lname),
                                      ),
                                    ),
                                    Container(
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(20),
//                                        gradient: new LinearGradient(
//                                            colors: [
//                                              Color.fromRGBO(245, 229, 186, 0.9),
//                                              Color.fromRGBO(245, 255, 255, 0.9),
//                                            ],
//                                            begin: const FractionalOffset(0.0, 0.0),
//                                            end: const FractionalOffset(1.0, 0.0),
//                                            stops: [0.0, 1.0],
//                                            tileMode: TileMode.clamp),
                                      ),

                                      margin: EdgeInsets.only(top: 20),
                                      child: TextFormField(
                                        style: TextStyle(color: Colors.white),
                                        decoration: InputDecoration(labelText: 'Email',
                                          labelStyle: TextStyle(color:Color.fromRGBO(30, 57, 97, 1),fontSize: 18),
                                          border: OutlineInputBorder(
                                            borderRadius: BorderRadius.circular(20),
                                          ),
                                        ),
                                        validator: (value){
                                          if (value.isEmpty){
                                            return 'Please enter Email';
                                          }
                                          return null;
                                        },
                                        onSaved: (email) => setState(() => user.email = email),
                                      ),
                                    ),
                                    Container(
                                      decoration: BoxDecoration(
//                                        borderRadius: BorderRadius.circular(20),
//                                        gradient: new LinearGradient(
//                                            colors: [
//                                              Color.fromRGBO(245, 229, 186, 0.9),
//                                              Color.fromRGBO(245, 255, 255, 0.9),
//                                            ],
//                                            begin: const FractionalOffset(0.0, 0.0),
//                                            end: const FractionalOffset(1.0, 0.0),
//                                            stops: [0.0, 1.0],
//                                            tileMode: TileMode.clamp),
                                      ),
                                      margin: EdgeInsets.only(top: 20),
                                      child: TextFormField(
                                        style: TextStyle(color: Colors.white),
                                        decoration: InputDecoration(labelText: 'Password',
                                          labelStyle: TextStyle(color:Color.fromRGBO(30, 57, 97, 1),fontSize: 18),
                                          border: OutlineInputBorder(
                                            borderRadius: BorderRadius.circular(20),
                                          ),
                                        ),
                                        validator: (value){
                                          if (value.isEmpty){
                                            return 'Please enter Password';
                                          }
                                          return null;
                                        },
                                        onSaved: (pass) => setState(() => user.password = pass),
                                      ),
                                    ),

                                    Container(

                                      padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 106.0),
                                      child: RaisedButton(
                                        textColor: Colors.white,
                                        color: Color.fromRGBO(9, 125, 164, 1),
                                        shape: RoundedRectangleBorder(borderRadius: new BorderRadius.circular(30.0)),
                                        padding: EdgeInsets.all(8),
                                        onPressed: (){
                                          final form = formKey.currentState;
                                          if(form.validate()){
                                            form.save();

                                            var res = SQLiteDbProvider.db.addUser(user);
                                            //SQLiteDbProvider.db.getUserbyEmail(user.email);
                                            // print(res);
                                            _showDialog(context);
                                            form.reset();
                                          }
                                        },
                                        child: Text('Submit',style: TextStyle(fontSize: 24),),
                                      ),
                                    ),

                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: <Widget>[
                                        Text(
                                          'Already Have an Account ?',
                                          style: TextStyle(fontFamily: 'Montserrat'),
                                        ),
                                        SizedBox(width: 5.0),
                                        InkWell(
                                          onTap: () {
                                            Navigator.pop(context);
                                            Navigator.push(
                                                context, MaterialPageRoute(builder: (context) => Login())
                                            );
                                          },
                                          child: Text(
                                            'Login',
                                            style: TextStyle(
                                                color: Color.fromARGB(255, 255, 255, 255),
                                                fontFamily: 'Montserrat',
                                                fontWeight: FontWeight.bold,
                                                decoration: TextDecoration.underline),
                                          ),
                                        )
                                      ],
                                    ),
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
      .showSnackBar(SnackBar(content: Text('User added')));
}
}
