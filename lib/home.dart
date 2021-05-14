import "package:flutter/material.dart";
import 'package:flutter/rendering.dart';
import 'package:flutter_auths/pages/loginScreen.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int currentIndex = 0;
  //FirebaseAuth _auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Home Page'),
        ),
        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                'Home Page',
                style: TextStyle(
                  fontSize: 22,
                ),
              ),
              Text(
                "Welcome to the Application!!",
                style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                    fontStyle: FontStyle.italic),
              ),
              Container(
                height: MediaQuery.of(context).size.height / 2,
                decoration: BoxDecoration(
                    image:
                        DecorationImage(image: AssetImage('assets/shoes.jpg'))),
              ),
              Container(
                padding: EdgeInsets.symmetric(vertical: 5.0),
                width: 350.0,
                height: 60.0,
                child: RaisedButton(
                  color: Colors.cyanAccent[500],
                  child: Text(
                    'Logout',
                    style: TextStyle(fontSize: 20, color: Colors.white),
                  ),
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => LoginScreen()));
                  },
                ),
              ),
            ],
          ),
        ));
  }
}
