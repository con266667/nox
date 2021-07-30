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
    ..speed = Duration(seconds: 12),
    Profile()
    ..title = 'Sunny'
    ..color = Colors.yellow
    ..timeout = Duration(minutes: 30)
    ..speed = Duration(seconds: 10),
    Profile()
    ..title = '4-7-8'
    ..timeout = Duration(minutes: 20)
    ..speed = Duration(seconds: 19)
    ..map = [0, 0.33, 0.66, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0.875, 0.75, 0.625, 0.5, 0.325, 0.125, 0]
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
    prefs.setInt('defaultSpeedMS', _default.speed.inMilliseconds);
    controller.notify();
  }

  static getDefault() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    _default.title = prefs.getString('defaultTitle') ?? _default.title;
    _default.color = Color.fromRGBO(prefs.getInt('defaultColorR') ?? _default.color.red, prefs.getInt('defaultColorG') ?? _default.color.green, prefs.getInt('defaultColorB') ?? _default.color.blue, 1.0);
    _default.timeout = Duration(seconds: prefs.getInt('defaultTimeout') ?? _default.timeout.inSeconds);
    _default.speed = Duration(milliseconds: prefs.getInt('defaultTimeoutMS') ?? _default.speed.inMilliseconds);
    profiles.first = _default;
    if(selectedProfile.title == 'Default') _selectedProfile = _default;
    controller.notify();
  }
}