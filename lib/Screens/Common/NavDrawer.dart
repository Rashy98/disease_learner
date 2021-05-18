import 'package:flutter/material.dart';
import 'package:disease_learner/Screens/Admin/AddDiseases.dart';
import 'package:disease_learner/Screens/User/ViewDiseaseNames.dart';



class NavDrawer extends StatefulWidget {
  @override
  NavDrawer({Key key, this.title}) : super(key: key);
  final String title;
  _NavDrawerD createState() => _NavDrawerD();


}
class _NavDrawerD extends State {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
          color: Color.fromRGBO(35,58,98,1),
        child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          Container(
            height: 100.0,
          child: DrawerHeader(

            child: Text(
              'MANUJAYA' ,
              style: TextStyle(color: Color.fromRGBO(245, 229, 186, 1), fontSize: 20),
            ),
          ),
//            decoration: BoxDecoration(
//                color: Colors.green,
//                image: DecorationImage(
//                    fit: BoxFit.fill,
//                    )),
          ),

          ListTile(
            leading: Icon(Icons.add),
            title: Text('Add Disease' , style: const TextStyle(
                color: Color.fromRGBO(254, 246, 222, 1),
              fontSize: 20
            ),
            ),
            onTap: () {
              Navigator.pop(context);
             Navigator.push(
                 context, MaterialPageRoute(builder: (context) => AddDiseases())
             );
            },
          ),






       ListTile(
            leading: Icon(Icons.edit),
            title: Text('Edit/Delete Diseases',style: const TextStyle(
                color: Color.fromRGBO(254, 246, 222, 1),
                fontSize: 20
            ),),
            onTap: () => { Navigator.of(context).pop(),
//               Navigator.push(
//                   context, MaterialPageRoute(builder: (context) => ListPage()))
                  },
          ),
          ListTile(
            leading: Icon(Icons.view_headline),
            title: Text("User's view",style: const TextStyle(
                color: Color.fromRGBO(254, 246, 222, 1),
                fontSize: 20
            ),),
            onTap: () => {
              Navigator.of(context).pop(),
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => ViewDiseaseNames())
              )
        },

          ),

          ListTile(
            leading: Icon(Icons.local_phone),
            title: Text('Contact Us' , style: const TextStyle(
                color: Color.fromRGBO(254, 246, 222, 1),
                fontSize: 20
            ),
            ),
            onTap: () {
              Navigator.pop(context);
//              Navigator.push(
//                  context, MaterialPageRoute(builder: (context) => ContactUs()));
            },

          ),
          ListTile(
            leading: Icon(Icons.exit_to_app),
            title: Text('Logout',style: const TextStyle(
                color: Color(0xFFFFFFFF),
                fontSize: 20
            ),),
            onTap: () => {
    Navigator.of(context).pop(),
//              Navigator.push(
//                context, MaterialPageRoute(builder: (context) => Login())
    })
            ],
          ),

      )

    );
  }
}