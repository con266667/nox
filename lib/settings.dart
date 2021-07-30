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
    ..timeout = Duration(minutes: 45)
    ..editable = [Editable.timeout, Editable.speed],
    Profile()
    ..title = 'Deep Sleep'
    ..color = Colors.deepPurple
    ..timeout = Duration(hours: 1)
    ..speed = Duration(seconds: 12)
    ..editable = [Editable.timeout],
    Profile()
    ..title = '4-7-8'
    ..timeout = Duration(minutes: 20)
    ..speed = Duration(seconds: 19)
    ..map = [0, 0.33, 0.66, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0.875, 0.75, 0.625, 0.5, 0.325, 0.125, 0]
    ..editable = [Editable.timeout, Editable.color]
  ];

  static List<Profile> get profilesbackup => [
    _default,
    Profile()
    ..title = 'Summer Night'
    ..color = Colors.deepOrange
    ..timeout = Duration(minutes: 45)
    ..editable = [Editable.timeout, Editable.speed],
    Profile()
    ..title = 'Deep Sleep'
    ..color = Colors.deepPurple
    ..timeout = Duration(hours: 1)
    ..speed = Duration(seconds: 12)
    ..editable = [Editable.timeout],
    Profile()
    ..title = '4-7-8'
    ..timeout = Duration(minutes: 20)
    ..speed = Duration(seconds: 19)
    ..map = [0, 0.33, 0.66, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0.875, 0.75, 0.625, 0.5, 0.325, 0.125, 0]
    ..editable = [Editable.timeout, Editable.color]
  ];

  static Profile get selectedProfile => _selectedProfile;
  static set selectedProfile (v) {
    _selectedProfile = v;
    saveSelected();
    controller.notify();
  }

  static Profile profile(String namestr) => profiles.firstWhere((e) => e.title.toLowerCase().replaceAll(' ', '') == namestr);

  static saveSelected() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('selectedProfile', _selectedProfile.title);
  }

  static saveAll() {
    profiles.forEach((e) => saveProfile(e.title));
  }

  static saveProfile(String name) async {
    String newname = name.toLowerCase().replaceAll(' ', '');
    SharedPreferences prefs = await SharedPreferences.getInstance();
    //prefs.setString('${newname}Title', _default.title);
    prefs.setInt('${newname}ColorR', profile(newname).color.red);
    prefs.setInt('${newname}ColorG', profile(newname).color.green);
    prefs.setInt('${newname}ColorB', profile(newname).color.blue);
    prefs.setInt('${newname}Timeout', profile(newname).timeout.inSeconds);
    prefs.setInt('${newname}SpeedMS', profile(newname).speed.inMilliseconds);
    controller.notify();
  }

  static getAll() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    selectedProfile = profiles.firstWhere((e) => e.title == (prefs.getString('selectedProfile') ?? profiles.first));
    profiles.forEach((e) => getProfile(e.title));
  }

  static getProfile(String name) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String newname = name.toLowerCase().replaceAll(' ', '');
    profile(newname).color = Color.fromRGBO(prefs.getInt('${newname}ColorR') ?? profile(newname).color.red, prefs.getInt('${newname}ColorG') ?? profile(newname).color.green, prefs.getInt('${newname}ColorB') ?? profile(newname).color.blue, 1.0);
    profile(newname).timeout = Duration(seconds: prefs.getInt('${newname}Timeout') ?? profile(newname).timeout.inSeconds);
    profile(newname).speed = Duration(milliseconds: prefs.getInt('${newname}SpeedMS') ?? profile(newname).speed.inMilliseconds);
    if(selectedProfile.title == name) _selectedProfile = profile(newname);
    controller.notify();
  }

  static reset(String name) {
    profiles[profiles.indexWhere((e) => e.title == name)] = profilesbackup.firstWhere((e) => e.title == name);
    saveProfile(name);
    controller.notify();
  }
}