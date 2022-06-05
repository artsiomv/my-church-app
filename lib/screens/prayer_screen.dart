import 'package:flutter/material.dart';

class PrayerScreen extends StatelessWidget {
  static String id = 'prayer_screen';
  const PrayerScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Text('Prayer'),
      ),
    );
  }
}
