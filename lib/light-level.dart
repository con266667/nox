import 'dart:math';

class LightLevel {
  static double speed = 0.5;
  static Duration timeout = Duration(minutes: 30);
  static Stream<double> get stream => Stream<double>.periodic(Duration(milliseconds: 25), (x) => sin((x / (65 - (32 * speed)))+1) / 2 + 0.5);

  static Future startTimer() async {
    await Future.delayed(timeout);
    return;
  }
}