import 'package:flutter/material.dart';
import 'package:flutter_auths/components/rounded_button.dart';
import 'package:flutter_auths/components/text_field_container.dart';
import 'package:flutter_auths/controllers/authentications.dart';
import 'package:flutter_auths/fblogin.dart';
import 'package:flutter_auths/pages/signupScreen.dart';
import 'package:flutter_auths/components/or_divider.dart';
import 'package:flutter_auths/components/social_icon.dart';
import 'package:flutter_auths/constantswelcome.dart';
import 'package:flutter_auths/googlesignin.dart';
import 'package:flutter_auths/firstscreengoogle.dart';
import 'package:flutter_auths/firstscreenfacebook.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  String email;
  String password;
  GlobalKey<FormState> formkey = GlobalKey<FormState>();

  void login() {
    if (formkey.currentState.validate()) {
      formkey.currentState.save();
      signin(email, password, context).then((value) {
        if (value != null) {}
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              SizedBox(height: size.height * 0.02),
              Container(
                height: MediaQuery.of(context).size.height / 3.5,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage('assets/signup.png'))),
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 20.0),
                child: Text(
                  "Login Here",
                  style: TextStyle(
                    fontSize: 30.0,
                  ),
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width * 0.90,
                child: Form(
                  key: formkey,
                  child: Column(
                    children: <Widget>[
                      TextFieldContainer(
                        child: TextFormField(
                          decoration: InputDecoration(
                            icon: Icon(
                              Icons.email,
                              color: kPrimaryColor,
                            ),
                            hintText: 'Email',
                            border: InputBorder.none,
                          ),
                          validator: (val) =>
                              val.isEmpty ? 'Enter an Email' : null,
                          onChanged: (val) {
                            setState(() => email = val);
                          },
                        ),
                      ),
                      TextFieldContainer(
                        child: TextFormField(
                          decoration: InputDecoration(
                            icon: Icon(
                              Icons.lock,
                              color: kPrimaryColor,
                            ),
                            suffixIcon: Icon(
                              Icons.visibility,
                              color: kPrimaryColor,
                            ),
                            hintText: 'Enter Password',
                            border: InputBorder.none,
                          ),
                          obscureText: true,
                          validator: (val) => val.length < 6
                              ? 'Enter a password 6+ chars long'
                              : null,
                          onChanged: (val) {
                            setState(() => password = val);
                          },
                        ),
                      ),
                      RoundedButton(
                        // passing an additional context parameter to show dialog boxs
                        text: "LOGIN",
                        press: login,
                        color: kPrimaryColor,
                        textColor: Colors.white,
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 10.0,
              ),
              InkWell(
                onTap: () {
                  // send to login screen
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => SignUpScreen()));
                },
                child: Text(
                  "New User? SignUp first",
                ),
              ),
              SizedBox(height: 12.0),
              OrDivider(),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  SocalIcon(
                    iconSrc: "assets/google.svg",
                    press: () {
                      signInWithGoogle().then((result) {
                        if (result != null) {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) {
                                return FirstScreen();
                              },
                            ),
                          );
                        }
                      });
                    },
                  ),
                  SocalIcon(
                    iconSrc: "assets/facebook.svg",
                    press: () {
                      signInWithFacebook().then((result) {
                        if (result != null) {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) {
                                return FirstScreenFB();
                              },
                            ),
                          );
                        }
                      });
                    },
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
