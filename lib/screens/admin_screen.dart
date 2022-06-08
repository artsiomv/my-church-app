import 'package:flutter/material.dart';
import 'package:my_church_app/components/rounded_button.dart';
import 'package:my_church_app/screens/add_event_admin_screen.dart';
import 'package:my_church_app/screens/add_service_stream_admin_screen.dart';

class AdminScreen extends StatefulWidget {
  static String id = 'admin_screen';
  const AdminScreen({Key? key}) : super(key: key);

  @override
  State<AdminScreen> createState() => _AdminScreenState();
}

class _AdminScreenState extends State<AdminScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Admin'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            RoundedButton(
              color: Colors.blueAccent,
              title: 'Add Event',
              onTap: () {
                Navigator.pushNamed(context, AddEventScreen.id);
              },
            ),
            RoundedButton(
              color: Colors.blueAccent,
              title: 'Add Service Stream',
              onTap: () {
                Navigator.pushNamed(context, AddServiceStreamScreen.id);
              },
            ),
          ],
        ),
      ),
    );
  }
}
