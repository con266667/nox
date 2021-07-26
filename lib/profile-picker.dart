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
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Padding(
            //   padding: const EdgeInsets.only(left: 25.0, top: 15),
            //   child: GestureDetector(
            //     onTap: () => Navigator.pop(context),
            //     child: Icon(Icons.arrow_back_ios)
            //   ),
            // ),
            Expanded(
              child: ListView(
                padding: EdgeInsets.only(left: 20, right: 20, top: 15),
                children: Settings.profiles.map((e) => ProfileCard(profile: e)).toList()
              ),
            ),
          ],
        ),
      ),
    );
  }
}