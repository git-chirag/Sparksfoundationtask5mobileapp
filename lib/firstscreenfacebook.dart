import 'package:flutter/material.dart';
import 'package:flutter_auths/main.dart';
import 'package:flutter_auths/pages/loginScreen.dart';
import 'fblogin.dart';

class FirstScreenFB extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
              colors: [Colors.white, Color(0xFF18FFFF)]),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            children: <Widget>[
              Container(
                padding: EdgeInsets.all(50),
                child: Text("Login Succesfull!",
                    style:
                        TextStyle(fontWeight: FontWeight.w300, fontSize: 20)),
              ),
              CircleAvatar(
                backgroundImage: NetworkImage(
                  imageUrl,
                ),
                radius: 60,
                backgroundColor: Colors.transparent,
              ),
              SizedBox(height: 40),
              Text(
                'NAME',
                style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                    color: Colors.black54),
              ),
              Text(
                name,
                style: TextStyle(
                    fontSize: 15,
                    color: Colors.black,
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 20),
              Text(
                'EMAIL',
                style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                    color: Colors.black54),
              ),
              Text(
                email,
                style: TextStyle(
                    fontSize: 15,
                    color: Colors.black,
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 40),
              Container(
                padding: EdgeInsets.symmetric(vertical: 5.0),
                width: 350.0,
                height: 60.0,
                child: RaisedButton(
                  color: Colors.cyanAccent[600],
                  //shape: StadiumBorder(),
                  child: Text(
                    'Logout',
                    style:
                        TextStyle(fontSize: 20, color: Colors.lightBlueAccent),
                  ),
                  onPressed: () {
                    facebookLogin.logOut();
                    Navigator.of(context).pushAndRemoveUntil(
                        MaterialPageRoute(builder: (context) {
                      return LoginScreen();
                    }), ModalRoute.withName('/'));
                  },
                ),
              ),
              Container(
                padding: EdgeInsets.symmetric(vertical: 5.0),
                width: 350.0,
                height: 60.0,
                child: RaisedButton(
                  color: Colors.cyanAccent[700],
                  child: Text(
                    'Navigate Further',
                    style: TextStyle(fontSize: 20, color: Colors.white),
                  ),
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => HomePage()));
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
