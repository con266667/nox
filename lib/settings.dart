import 'package:flutter/material.dart';
import 'controller.dart';
import 'profile.dart';

class Settings extends Controller {
  static Profile _selectedProfile = Profile();
  static Controller controller = Controller();

  static List<Profile> profiles = [
    Profile(),
    Profile()
    ..title = 'Summer Night'
    ..color = Colors.deepOrange
    ..timeout = Duration(minutes: 45),
    Profile()
    ..title = 'Deep Sleep'
    ..color = Colors.deepPurple
    ..timeout = Duration(hours: 1)
    ..speed = 0.3
  ];
  static Profile get selectedProfile => _selectedProfile;
  static set selectedProfile (v) {
    _selectedProfile = v;
    controller.notify();
  }
}