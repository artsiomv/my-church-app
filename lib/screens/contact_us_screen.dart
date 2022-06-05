import 'package:flutter/material.dart';

class ContactUsScreen extends StatelessWidget {
  static String id = 'contact_us_screen';
  const ContactUsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Text('Contact Us Screen'),
      ),
    );
  }
}
