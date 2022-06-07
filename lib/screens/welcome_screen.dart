import 'package:flutter/material.dart';

class WelcomeScreen extends StatefulWidget {
  static String id = 'welcome_screen';

  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Center(
              child: Container(
                alignment: Alignment.topCenter,
                child: const Text(
                  'Welcome to\nLight To The World,\nhere is whats new',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 30.0),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
