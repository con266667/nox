import 'dart:math';
import 'settings.dart';

class LightLevel {
  static double get speed => Settings.selectedProfile.speed;
  static Duration get timeout => Settings.selectedProfile.timeout;
  static Stream<double> get stream => Stream<double>.periodic(Duration(milliseconds: 25), (x) => sin((x / (65 - (32 * speed)))+1) / 2 + 0.5);

  static Future startTimer() async {
    await Future.delayed(timeout);
    return;
  }
}