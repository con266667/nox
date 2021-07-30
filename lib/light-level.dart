import 'dart:math';
import 'settings.dart';

class LightLevel {
  static Duration get speed => Settings.selectedProfile.speed;
  static Duration get timeout => Settings.selectedProfile.timeout;
  static List<double> get map => Settings.selectedProfile.map;
  static int ms = 20;
  static int minspeed = 25000;
  static int maxspeed = 10000;
  static Stream<double> get stream => Stream<double>.periodic(Duration(milliseconds: ms), (x) => getStreamValue(x));

  static double getStreamValue(int x) {
    if(speed.inMilliseconds <= 1) Settings.selectedProfile.speed = Duration(milliseconds: speed.inMilliseconds * 7000 + 3000);
    double msSpeed = speed.inMilliseconds / ms / pi / 2;
    double val = 0.0;
    val = sin((x / msSpeed) - pi / 2) / 2 + 0.5;
    if(map.isNotEmpty) {
      val = (x / (speed.inMilliseconds / ms / speed.inSeconds)) % speed.inSeconds.toDouble();
      return toMap(val);
    }
    return val;
  }

  static toMap(double val) {
    print(val);
    double base = map[val.toInt()];
    double diff = val - val.toInt();
    double nextVal = val.toInt() >= map.length ? map[0] : map[val.toInt() + 1];
    double diffVal = (nextVal - base) * diff;
    return base + diffVal;
  }

  static Future startTimer() async {
    await Future.delayed(timeout);
    return;
  }
}