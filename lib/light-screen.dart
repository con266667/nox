import 'package:flutter/material.dart';
import 'package:wakelock/wakelock.dart';
import 'settings.dart';
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
    Wakelock.enable();
    await LightLevel.startTimer();
    if(mounted) setState(() => running = false);
    Wakelock.disable();
  }

  @override
  void dispose() {
    Wakelock.disable();
    super.dispose();
  }

  colorInt(int v, snapshot) {
    if(!running) return 0;
    return ((snapshot.data ?? 0.0) * v).round();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: StreamBuilder(
        stream: LightLevel.stream,
        builder: (context, snp) {
          return Container(
            //color: running ? Color.fromRGBO(150, 190, 255, snapshot.data ?? 0.0) : Colors.black,
            decoration: BoxDecoration(
              gradient: RadialGradient(
                radius: 2.0,
                //stops: [0.4, 1.0],
                colors: [
                  Color.fromRGBO(colorInt(Settings.selectedProfile.color.red, snp), colorInt(Settings.selectedProfile.color.green, snp), colorInt(Settings.selectedProfile.color.blue, snp), 1.0),
                  //Color.fromRGBO(150, 190, 255, 1.0),
                  Colors.black
                ]
              )
            ),
          );
        },
      )
    );
  }
}