import 'package:flutter/material.dart';
import 'package:my_church_app/screens/add_service_stream_admin_screen.dart';
import 'package:my_church_app/screens/add_event_admin_screen.dart';
import 'package:my_church_app/screens/admin_screen.dart';
import 'package:my_church_app/screens/contact_us_screen.dart';
import 'package:my_church_app/screens/email_login_screen.dart';
import 'package:my_church_app/screens/email_register_screen.dart';
import 'package:my_church_app/screens/init_screen.dart';
import 'package:my_church_app/screens/media_screen.dart';
import 'package:my_church_app/screens/prayer_screen.dart';
import 'package:my_church_app/screens/settings_screen.dart';
import 'package:my_church_app/screens/welcome_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:provider/provider.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyChurch());
}

class MyChurch extends StatelessWidget {
  const MyChurch({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData.dark().copyWith(
        primaryColor: Colors.amber,
      ),
      initialRoute: InitScreen.id,
      routes: {
        PrayerScreen.id: (context) => const PrayerScreen(),
        MediaScreen.id: (context) => const MediaScreen(),
        WelcomeScreen.id: (context) => const WelcomeScreen(),
        InitScreen.id: (context) => const InitScreen(),
        ContactUsScreen.id: (context) => const ContactUsScreen(),
        SettingsScreen.id: (context) => const SettingsScreen(),
        EmailLoginScreen.id: (context) => const EmailLoginScreen(),
        EmailRegistrationScreen.id: (context) => EmailRegistrationScreen(),
        AdminScreen.id: (context) => AdminScreen(),
        AddServiceStreamScreen.id: (context) => AddServiceStreamScreen(),
        AddEventScreen.id: (context) => AddEventScreen(),
      },
    );
  }
}
