import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'settings.dart';
import 'profile.dart';

class EditProfile extends StatefulWidget {
  const EditProfile({ Key key, @required this.profile}) : super(key: key);

  final Profile profile;

  @override
  _EditProfileState createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  List<Color> colors = [
    Color.fromRGBO(150, 190, 255, 1),
    Colors.deepOrange,
    Colors.deepPurple,
    Colors.pink,
    Color.fromRGBO(10, 200, 5, 1),
    Colors.redAccent,
    Colors.yellow
  ];

  @override
  void initState() {
    Settings.controller.add(update);
    super.initState();
  }

  update() {
    if(mounted) setState(() {});
  }

  bool colorsAreEqual(Color a, Color b) {
    return a.red == b.red && a.green == b.green && a.blue == b.blue;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(left: 25, right: 25, top: 15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  GestureDetector(
                    onTap: () => Navigator.pop(context),
                    child: Icon(Icons.arrow_back_ios)
                  ),
                  Container(width: 5),
                  Text(widget.profile.title, style: Theme.of(context).textTheme.headline1),
                ],
              ),
              Visibility(
                visible: widget.profile.editable.contains(Editable.speed),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(height: 30),
                    Text('Cycle Length', style: Theme.of(context).textTheme.subtitle1),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Text('5s'),
                        Expanded(
                          child: CupertinoSlider(
                            min: 5000,
                            max: widget.profile.speed.inMilliseconds > 15000 ? widget.profile.speed.inMilliseconds.toDouble() : 15000.0,
                            value: widget.profile.speed.inMilliseconds.toDouble(), 
                            onChanged: (v) {
                              Settings.profiles.firstWhere((e) => e.title == widget.profile.title).speed = Duration(milliseconds: v.toInt());
                              Settings.saveProfile(widget.profile.title);
                            },
                            //divisions: 6,
                          ),
                        ),
                        Text('15s')
                      ],
                    ),
                  ],
                ),
              ),
              Visibility(
                visible: widget.profile.editable.contains(Editable.timeout),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(height: 15),
                    Text('Timeout', style: Theme.of(context).textTheme.subtitle1),
                    Container(height: 5),
                    Container(
                      height: 40,
                      child: CupertinoTimerPicker(
                        initialTimerDuration: widget.profile.timeout,
                        onTimerDurationChanged: (v) {
                          Settings.profiles.firstWhere((e) => e.title == widget.profile.title).timeout = v;
                          Settings.saveProfile(widget.profile.title);
                        }
                      ),
                    ),
                  ],
                ),
              ),
              Visibility(
                visible: widget.profile.editable.contains(Editable.color),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(height: 20),
                    Text('Color', style: Theme.of(context).textTheme.subtitle1),
                    Container(height: 8),
                    Row(
                      children: colors.map((e) => 
                        GestureDetector(
                          onTap: () {
                            Settings.profiles.firstWhere((e) => e.title == widget.profile.title).color = e;
                            Settings.saveProfile(widget.profile.title);
                          },
                          child: Card(
                            color: e,
                            elevation: colorsAreEqual(widget.profile.color, e) ? 0 : 10,
                            child: Container(
                              width: 20,
                              height: 20,
                              decoration: colorsAreEqual(widget.profile.color, e) ? BoxDecoration(
                                borderRadius: BorderRadius.circular(4),
                                border: Border.all(
                                  color: Colors.black,
                                  width: 2
                                )
                              ) : null
                            ),
                            margin: EdgeInsets.only(right: 8),
                          ),
                        )
                      ).toList()
                    )
                  ],
                ),
              ),
              Container(height: 10),
              Center(
                child: MaterialButton(
                  onPressed: () {
                    Settings.reset(widget.profile.title);
                    Navigator.pop(context);
                  },
                  child: Text("Reset", style: Theme.of(context).textTheme.subtitle2)
                )
              )
            ]
          ),
        ),
      ),
    );
  }
}