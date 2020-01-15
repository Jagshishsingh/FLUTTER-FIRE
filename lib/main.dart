import 'package:firebase_auth/firebase_auth.dart' as firebase_auth;
import 'package:flutter/material.dart';
import 'package:firebase/firebase.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
void main() => runApp(MyApp());

class MyApp extends StatelessWidget{
  @override 
  Widget build(BuildContext context){
    return new MaterialApp(
      title: 'Firebase demo',
      home: new HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {

  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GoogleSignIn googleSignIn = new GoogleSignIn();

  Future<FirebaseUser> _signIn() async{
    GoogleSignInAccount googleSignInAccount = await googleSignIn.signIn();
    GoogleSignInAuthentication googleAuth  = await googleSignInAccount.authentication;
    final AuthCredential credential = firebase_auth.GoogleAuthProvider.getCredential(
    idToken: googleAuth.idToken, accessToken: googleAuth.accessToken,
    );
    final FirebaseUser  user = (await _auth.signInWithCredential(credential)).user;
    return user;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title: new Text("Firebase connection"),
      ),
      body: new Padding(
        padding: new EdgeInsets.all(20.0),
        child: new Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            new RaisedButton(
              onPressed: ()=> _signIn().then((FirebaseUser user) => print(user)).catchError((e)=> print(e)),
              child: new Text("sign in"),
              color: Colors.green,
            ),
            new RaisedButton(
              onPressed: null,
              child: new Text("sign out"),
              color: Colors.red,
            ),
          ],
        ),
      ),
    );
  }
}