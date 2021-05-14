import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_facebook_login/flutter_facebook_login.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

final FirebaseAuth _auth = FirebaseAuth.instance;

String name = "";
String email = "";
String imageUrl = "";
FacebookLogin facebookLogin = FacebookLogin();
Future<String> signInWithFacebook() async {
  // await Firebase.initializeApp();

  final result = await facebookLogin.logIn(['email']);
  final token = result.accessToken.token;
  final graphResponse = await http.get(
      'https://graph.facebook.com/v2.12/me?fields=name,first_name,last_name,email,picture&access_token=${token}');
  if (result.status == FacebookLoginStatus.loggedIn) {
    final credential = FacebookAuthProvider.getCredential(accessToken: token);
    _auth.signInWithCredential(credential);
  }
  final profile = jsonDecode(graphResponse.body);
  name = profile["name"];
  email = profile["email"];
  imageUrl = profile["picture"]['data']['url'];
  // print(profile.toString());
  // print(imageUrl);

  print('signInWithFacebook succeeded');

  return "Error";
}

Future<void> signOutFacebook() async {
  // await _facebookLogin.logOut();
  await _auth.signOut();
  print("User Signed Out");
}
