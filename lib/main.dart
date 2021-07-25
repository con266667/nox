import 'package:flutter/material.dart';
import 'light-screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: GestureDetector(
          onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => LightScreen())),
          child: Container(
            child: Card(
              elevation: 0,
              child: Container(
                width: 150,
                height: 40,
                child: Center(child: Text('Start', style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),))
              ),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12.0)
              ),
            ),
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  blurRadius: 200,
                  spreadRadius: 0.5
                )
              ]
            ),
          ),
        ),
      )
    );
  }
}
