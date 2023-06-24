import 'package:flutter/material.dart';
import 'package:mosiga_users/presentation/nav_icons_icons.dart';
import 'package:mosiga_users/screens/chat_screen.dart';
import 'package:mosiga_users/screens/history_screen.dart';
import 'package:mosiga_users/screens/home_screen.dart';
import 'package:mosiga_users/screens/profile_screen.dart';
import 'package:mosiga_users/theme/theme.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _selectedIndex = 0;

  List screen = [
    const HomeScreen(),
    const HistoryScreen(),
    const ChatScreen(),
    const ProfileScreen(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    bool darkTheme =
        MediaQuery.of(context).platformBrightness == Brightness.dark;
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        backgroundColor: darkTheme ? Colors.grey.shade900 : Colors.white,
        body: screen[_selectedIndex],
        bottomNavigationBar: SizedBox(
          height: MediaQuery.of(context).size.height / (1.618 * 5),
          child: Container(
            color: darkTheme ? Colors.amber.shade400 : primary,
            padding: const EdgeInsets.symmetric(horizontal: 18),
            child: BottomNavigationBar(
              items: const <BottomNavigationBarItem>[
                BottomNavigationBarItem(
                  icon: Icon(NavIcons.homeoutlined),
                  label: 'Home',
                ),
                BottomNavigationBarItem(
                  icon: Icon(NavIcons.riwayat),
                  label: 'History',
                ),
                BottomNavigationBarItem(
                  icon: Icon(NavIcons.pesan),
                  label: 'Chat',
                ),
                BottomNavigationBarItem(
                  icon: Icon(NavIcons.orang),
                  label: 'Profile',
                ),
              ],
              type: BottomNavigationBarType.fixed,
              iconSize: 28,
              backgroundColor: darkTheme ? Colors.amber.shade400 : primary,
              showSelectedLabels: false,
              showUnselectedLabels: false,
              elevation: 0,
              currentIndex: _selectedIndex,
              selectedItemColor:
                  darkTheme ? Colors.grey.shade900 : Colors.white,
              unselectedItemColor:
                  darkTheme ? Colors.white : Colors.grey.shade900,
              onTap: _onItemTapped,
            ),
          ),
        ),
      ),
    );
  }
}
