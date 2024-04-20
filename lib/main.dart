import 'package:flutter/material.dart';
import 'package:kraftnightt/addfriends/friends.dart';
import 'addItenary/add.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: AddPage(),
    );
  }
}
