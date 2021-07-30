import 'dart:ui';

class Profile {
  String title = 'Default';
  Color color = Color.fromRGBO(150, 190, 255, 1);
  Duration timeout = Duration(minutes: 30);
  List<double> map = [];
  Duration speed = Duration(seconds: 12);
  List<Editable> editable = [Editable.color, Editable.speed, Editable.timeout];
}

enum Editable {
  color,
  timeout,
  speed
}