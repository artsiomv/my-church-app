import 'package:flutter/material.dart';

class AddEventScreen extends StatelessWidget {
  static String id = 'add_event_screen';
  const AddEventScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Text('Add Event'),
      ),
    );
  }
}
