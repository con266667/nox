import 'package:flutter/material.dart';
import 'light-level.dart';

class LightScreen extends StatelessWidget {
  const LightScreen({ Key key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: StreamBuilder(
        stream: LightLevel.stream,
        builder: (context, snapshot) {
          return Container(
            color: Color.fromRGBO(150, 190, 255, snapshot.data ?? 0.0),
          );
        },
      )
    );
  }
}