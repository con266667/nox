import 'package:flutter/material.dart';
import 'settings.dart';
import 'profile-card.dart';

class ProfilePicker extends StatefulWidget {
  const ProfilePicker({ Key key }) : super(key: key);

  @override
  _ProfilePickerState createState() => _ProfilePickerState();
}

class _ProfilePickerState extends State<ProfilePicker> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(
          padding: EdgeInsets.only(left: 20, right: 20, top: 15),
          children: Settings.profiles.map((e) => ProfileCard(profile: e)).toList()
        ),
      ),
    );
  }
}