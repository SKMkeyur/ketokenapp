import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Option{
  late Icon icon;
  late String title;

  Option(this.icon, this.title);
}

final options=[
  Option(Icon(FontAwesomeIcons.fingerprint), "Touch id"),
  Option(Icon(FontAwesomeIcons.key), "Change Password"),
  Option(Icon(FontAwesomeIcons.bell), "Notifications"),
  Option(Icon(FontAwesomeIcons.users), "About US"),
  Option(Icon(FontAwesomeIcons.headset), "Help & Support"),
  Option(Icon(FontAwesomeIcons.questionCircle), "Faq's"),
];