import 'package:flutter/material.dart';

class Help extends StatelessWidget {
  const Help({ Key key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(
          padding: EdgeInsets.only(left: 25, top: 15, right: 25),
          children: [
            Row(
                children: [
                  GestureDetector(
                    onTap: () => Navigator.pop(context),
                    child: Icon(Icons.arrow_back_ios)
                  ),
                  Container(width: 5),
                  Text('Help', style: Theme.of(context).textTheme.headline1),
                ],
              ),
            Container(height: 15),
            Text('How it works', style: Theme.of(context).textTheme.subtitle1),
            Container(height: 5),
            Text(
            '''Nox uses your phone screen to pulse a light that fills your bedroom. As you fall asleep, you can match your breathing with the light.
            ''', style: Theme.of(context).textTheme.bodyText1),
            Container(height: 5),
            Text('How to use', style: Theme.of(context).textTheme.subtitle1),
            Container(height: 5),
            Text(
            '''Place your phone face up beside your bed. Turn off all the lights and tap 'Start'. Adjust your phone brightness to your liking.
            ''', style: Theme.of(context).textTheme.bodyText1),
          ],
        )
      ),
    );
  }
}