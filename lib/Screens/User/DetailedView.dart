import 'package:flutter/material.dart';

class DetailPage extends StatelessWidget {
  final String disease_name ;
  final String description;
  final String symptoms;
  final String medication;
  DetailPage({Key key, this.disease_name,this.description,this.symptoms,this.medication}) : super(key: key);

  @override
  Widget build(BuildContext context) {


    final topContentText = Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        SizedBox(height: 50.0),
        Icon(
          Icons.bug_report,
          color: Colors.white,
          size: 40.0,
        ),
        Container(
          width: 90.0,
          child: new Divider(color: Colors.white),
        ),
        SizedBox(height: 10.0),
        Text(
          disease_name,
          style: TextStyle(color: Colors.white, fontSize: 45.0),
        ),
        SizedBox(height: 10.0),
//        Row(
//          mainAxisAlignment: MainAxisAlignment.start,
//          children: <Widget>[
//            Expanded(flex: 1, child: levelIndicator),
//            Expanded(
//                flex: 6,
//                child: Padding(
//                    padding: EdgeInsets.only(left: 10.0),
//                    child: Text(
//                      lesson.level,
//                      style: TextStyle(color: Colors.white),
//                    ))),
////            Expanded(flex: 1, child: coursePrice)
//          ],
//        ),
      ],
    );

    final topContent = Stack(
      children: <Widget>[
        Container(
            padding: EdgeInsets.only(left: 10.0),
            height: MediaQuery.of(context).size.height * 0.5,
            decoration: new BoxDecoration(
              image: new DecorationImage(
                image: new AssetImage("lib/assets/images/detail.jpg"),
                fit: BoxFit.cover,
              ),
            )),
        Container(
          height: MediaQuery.of(context).size.height * 0.5,
          padding: EdgeInsets.all(40.0),
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(color: Color.fromRGBO(58, 66, 86, .9)),
          child: Center(
            child: topContentText,
          ),
        ),
        Positioned(
          left: 8.0,
          top: 60.0,
          child: InkWell(
            onTap: () {
              Navigator.pop(context);
            },
            child: Icon(Icons.arrow_back, color: Colors.white),
          ),
        )
      ],
    );

    final bottomContentText = Text(
      description,
      style: TextStyle(fontSize: 18.0),
    );

    final symptom = Card(
      child:Column(
        mainAxisSize: MainAxisSize.max,
        children: <Widget>[
          ListTile(
            leading: Icon(Icons.healing),
            title: Text('Symptoms',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
            subtitle: Text(symptoms,style: TextStyle(fontSize: 16),),
          )
        ],
      )
    );

    final medications = Card(
        child:Column(
          mainAxisSize: MainAxisSize.max,
          children: <Widget>[
            ListTile(
              leading: Icon(Icons.local_pharmacy),
              title: Text('Medication',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
              subtitle: Text(medication,style: TextStyle(fontSize: 16),),
            )
          ],
        )

    );
    final readButton = Container(
        padding: EdgeInsets.symmetric(vertical: 16.0),
        width: MediaQuery.of(context).size.width,
        child: RaisedButton(
          onPressed: () => {},
          color: Color.fromRGBO(58, 66, 86, 1.0),
          child:
          Text("Go Back", style: TextStyle(color: Colors.white)),
        ));



    final bottomContent = Container(
      // height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      // color: Theme.of(context).primaryColor,
      padding: EdgeInsets.all(40.0),
      child: Center(
        child: Column(
          children: <Widget>[bottomContentText, symptom,medications],
        ),
      ),
    );

    return Scaffold(
      body:Container(
        child: SingleChildScrollView(
        child: Column(
          children: <Widget>[topContent, bottomContent],
        ),
      )
      )
      );

  }
}