import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'light-level.dart';
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
      body: Padding(
        padding: const EdgeInsets.only(left: 20.0, right: 20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            MaterialButton(
              onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (_) => LightScreen())),
              child: Text('Start', style: TextStyle(fontWeight: FontWeight.w600, fontSize: 18, color: Colors.blueAccent)),
            ),
            Container(height: 5),
           Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text('Slow'),
                Expanded(
                  child: CupertinoSlider(
                      value: LightLevel.speed, 
                      onChanged: (v) => setState(() => LightLevel.speed = v),
                      divisions: 6,
                  ),
                ),
                Text('Fast')
              ],
            ),
            Container(height: 15),
            Container(
              height: 50,
              child: CupertinoTimerPicker(
                initialTimerDuration: Duration(minutes: 30),
                onTimerDurationChanged: (v) => setState(() => LightLevel.timeout = v),
              ),
            )
          ],
        ),
      )
    );
  }
}
