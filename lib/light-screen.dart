import 'package:flutter/material.dart';
import 'light-level.dart';

class LightScreen extends StatefulWidget {
  const LightScreen({ Key key }) : super(key: key);

  @override
  _LightScreenState createState() => _LightScreenState();
}

class _LightScreenState extends State<LightScreen> {

  bool running = true;

  @override
  void initState() {
    go();
    super.initState();
  }

  go() async {
    await LightLevel.startTimer();
    setState(() => running = false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: StreamBuilder(
        stream: LightLevel.stream,
        builder: (context, snapshot) {
          return Container(
            color: running ? Color.fromRGBO(150, 190, 255, snapshot.data ?? 0.0) : Colors.black,
          );
        },
      )
    );
  }
}