import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:my_church_app/screens/add_service_stream_admin_screen.dart';
import 'package:my_church_app/screens/contact_us_screen.dart';
import 'package:my_church_app/screens/media_screen.dart';
import 'package:my_church_app/screens/prayer_screen.dart';
import 'package:my_church_app/screens/settings_screen.dart';
import 'package:my_church_app/screens/welcome_screen.dart';

class InitScreen extends StatefulWidget {
  static String id = 'init_screen';
  const InitScreen({Key? key}) : super(key: key);

  @override
  State<InitScreen> createState() => _InitScreenState();
}

class _InitScreenState extends State<InitScreen> {
  final GlobalKey<CurvedNavigationBarState> _bottomNavigationKey = GlobalKey();
  int _page = 2;

  final List<Widget> _children = [
    ContactUsScreen(),
    MediaScreen(),
    WelcomeScreen(),
    PrayerScreen(),
    // AddServiceStreamScreen(),
    SettingsScreen()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: navigationBar(),
      body: _children.elementAt(_page),
    );
  }

  CurvedNavigationBar navigationBar() {
    return CurvedNavigationBar(
      key: _bottomNavigationKey,
      index: _page,
      height: 60.0,
      items: const <Widget>[
        NavBarIcon(icon: Icons.comment),
        NavBarIcon(icon: Icons.play_arrow),
        NavBarIcon(icon: Icons.home),
        NavBarIcon(icon: Icons.people),
        NavBarIcon(icon: Icons.settings),
      ],
      color: Colors.white,
      buttonBackgroundColor: Colors.white,
      backgroundColor: Colors.white.withOpacity(0),
      animationCurve: Curves.easeInOut,
      animationDuration: const Duration(milliseconds: 600),
      onTap: (index) {
        setState(() {
          _page = index;
        });
      },
      letIndexChange: (index) => true,
    );
  }
}

class NavBarIcon extends StatelessWidget {
  final IconData icon;
  const NavBarIcon({Key? key, required this.icon}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Icon(
      icon,
      size: 30,
      color: Colors.black,
    );
  }
}
