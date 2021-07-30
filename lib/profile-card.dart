import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'edit-profile.dart';
import 'settings.dart';
import 'profile.dart';

class ProfileCard extends StatelessWidget {
  const ProfileCard({Key key, @required this.profile}) : super(key: key);
  final Profile profile;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Settings.selectedProfile = profile;
        Navigator.pop(context);
      },
      child: Padding(
        padding: const EdgeInsets.only(bottom: 5),
        child: Card(
          elevation: 0,
          color: profile.color,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15.0)
          ),
          child: Container(
            height: 80,
            child: Row(
              children: [
                Container(width: 20),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(profile.title, style: Theme.of(context).textTheme.subtitle1),
                    Text(profile.timeout.inMinutes.toString() + 'min', style: Theme.of(context).textTheme.subtitle2.copyWith(color: Colors.white54)),
                  ],
                ),
                Spacer(),
                Visibility(
                  visible: profile.editable.isNotEmpty,
                  child: GestureDetector(
                    onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => EditProfile(profile: profile))),
                    child: SvgPicture.asset('assets/icons/settings.svg', color: Colors.white)
                  ),
                ),
                Container(width: 20),
              ],
            ),
          ),
        ),
      ),
    );
  }
}