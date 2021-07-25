import 'dart:math';

class LightLevel {
  static Stream<double> stream = Stream<double>.periodic(Duration(milliseconds: 25), (x) => sin((x / 40.0)+1) / 2 + 0.5);
}