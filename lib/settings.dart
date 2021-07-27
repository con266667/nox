import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'controller.dart';
import 'profile.dart';

class Settings extends Controller {
  static Controller controller = Controller();
  static Profile _default = Profile();
  static Profile _selectedProfile = _default;

  static List<Profile> profiles = [
    _default,
    Profile()
    ..title = 'Summer Night'
    ..color = Colors.deepOrange
    ..timeout = Duration(minutes: 45),
    Profile()
    ..title = 'Deep Sleep'
    ..color = Colors.deepPurple
    ..timeout = Duration(hours: 1)
    ..speed = 0.3,
    Profile()
    ..title = 'Sunny'
    ..color = Colors.yellow
    ..timeout = Duration(minutes: 30)
    ..speed = 0.65
  ];
  static Profile get selectedProfile => _selectedProfile;
  static set selectedProfile (v) {
    _selectedProfile = v;
    controller.notify();
  }

  static saveDefault() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('defaultTitle', _default.title);
    prefs.setInt('defaultColorR', _default.color.red);
    prefs.setInt('defaultColorG', _default.color.green);
    prefs.setInt('defaultColorB', _default.color.blue);
    prefs.setInt('defaultTimeout', _default.timeout.inSeconds);
    prefs.setDouble('defaultSpeed', _default.speed);
    controller.notify();
  }

  static getDefault() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    _default.title = prefs.getString('defaultTitle') ?? _default.title;
    _default.color = Color.fromRGBO(prefs.getInt('defaultColorR') ?? _default.color.red, prefs.getInt('defaultColorG') ?? _default.color.green, prefs.getInt('defaultColorB') ?? _default.color.blue, 1.0);
    _default.timeout = Duration(seconds: prefs.getInt('defaultTimeout') ?? _default.timeout.inSeconds);
    _default.speed = prefs.getDouble('defaultSpeed') ?? _default.speed;
    profiles.first = _default;
    if(selectedProfile.title == 'Default') _selectedProfile = _default;
    controller.notify();
  }
}