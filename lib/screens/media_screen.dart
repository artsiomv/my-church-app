import 'package:flutter/material.dart';

class MediaScreen extends StatelessWidget {
  static String id = 'media_screen';
  const MediaScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Text('Media'),
      ),
    );
  }
}
