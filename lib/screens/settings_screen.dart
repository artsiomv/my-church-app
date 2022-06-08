import 'package:flutter_signin_button/flutter_signin_button.dart';
import 'package:flutter/material.dart';
import 'package:my_church_app/screens/add_service_stream_admin_screen.dart';
import 'package:my_church_app/screens/email_login_screen.dart';

class SettingsScreen extends StatelessWidget {
  static String id = 'settings_screen';
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SignInButton(
              Buttons.GoogleDark,
              onPressed: () {
                //TODO: add sign in
              },
            ),
            SignInButton(
              Buttons.AppleDark,
              onPressed: () {
                //TODO: add sign in
              },
            ),
            SignInButtonBuilder(
              text: 'Get going with Email',
              icon: Icons.email,
              onPressed: () {
                Navigator.pushNamed(context, EmailLoginScreen.id);
                //TODO: add sign in
              },
              backgroundColor: Colors.blueGrey[700]!,
              width: 220.0,
            ),
          ],
        ),
      ),
    );
  }
}
