import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'settings.dart';
import 'profile-picker.dart';
import 'light-level.dart';
import 'light-screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        brightness: Brightness.dark,
        primarySwatch: Colors.blue,
        fontFamily: 'SF Pro',
        textTheme: TextTheme(
          headline1: TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: 43,
          ),
          subtitle1: TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: 20
          ),
          subtitle2: TextStyle(
            fontWeight: FontWeight.w500,
            fontSize: 16
          )
        )
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
  void initState() {
    Settings.controller.add(update);
    super.initState();
  }

  update() {
    if(mounted) setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(left: 20.0, right: 20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              GestureDetector(
                onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => ProfilePicker())),
                child: Card(
                  elevation: 0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15.0)
                  ),
                  child: Container(
                    height: 50,
                    child: Row(
                      children: [
                        Container(width: 20),
                        Text(Settings.selectedProfile.title, style: Theme.of(context).textTheme.subtitle1),
                        Spacer(),
                        VerticalDivider(
                          width: 3,
                          indent: 8,
                          endIndent: 8,
                        ),
                        Container(width: 8),
                        Icon(Icons.arrow_forward_ios),
                        Container(width: 5),
                      ],
                    ),
                  ),
                ),
              ),
              GestureDetector(
                onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => LightScreen())),
                child: Text('Start', style: Theme.of(context).textTheme.headline1.copyWith(color: CupertinoColors.activeBlue))
              ),
              Text('Help', style: Theme.of(context).textTheme.subtitle2),
            ],
          ),
        ),
      )
    );
  }
}
