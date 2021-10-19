import 'package:flutter/material.dart';
import 'package:prye_orquideas/pantallas/home_vivero.dart';
import 'package:prye_orquideas/pantallas/orquidea.dart';
import 'package:prye_orquideas/widget.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp>{

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text('Menu'),
        ),
        drawer: NavDrawer(),
      ),
      theme: ThemeData(
        primaryColor: Colors.green[300],
        accentColor: Colors.green
      ),
    );
  }
}
