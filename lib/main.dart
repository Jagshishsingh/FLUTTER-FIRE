import 'package:flutter/material.dart';
import 'package:firebase/firebase.dart';
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
              onPressed: null,
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