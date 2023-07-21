import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:mosiga_users/presentation/nav_icons_icons.dart';
import 'package:mosiga_users/screens/chat_screen.dart';
import 'package:mosiga_users/screens/history_screen.dart';
import 'package:mosiga_users/screens/home_screen.dart';
import 'package:mosiga_users/screens/profile_screen.dart';
import 'package:mosiga_users/theme/theme.dart';
import 'package:geolocator/geolocator.dart';

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

  // Fungsi untuk meminta izin lokasi saat MainScreen diinisialisasi
  Future<void> requestLocationPermission() async {
    LocationPermission _locationPermission =
        await Geolocator.requestPermission();

    if (_locationPermission == LocationPermission.denied ||
        _locationPermission == LocationPermission.deniedForever) {
      Fluttertoast.showToast(msg: "Anda Harus Mengizinkan GPS/Lokasi");

      if (Platform.isAndroid) {
        // Jika perangkat Android, buka pengaturan aplikasi untuk mengizinkan izin lokasi
        await Geolocator.openAppSettings();
        // Tunggu sejenak dan periksa lagi izin lokasi
        Future.delayed(Duration(seconds: 3), () {
          checkLocationPermissionStatus();
        });
      } else if (Platform.isIOS) {
        // Jika perangkat iOS, buka pengaturan aplikasi untuk mengizinkan izin lokasi
        await Geolocator.openLocationSettings();
        // Tunggu sejenak dan periksa lagi izin lokasi
        Future.delayed(Duration(seconds: 1), () {
          checkLocationPermissionStatus();
        });
      }
    }
  }

  // Fungsi untuk memeriksa izin lokasi setelah mengizinkannya di pengaturan
  Future<void> checkLocationPermissionStatus() async {
    LocationPermission _locationPermission = await Geolocator.checkPermission();

    if (_locationPermission == LocationPermission.denied ||
        _locationPermission == LocationPermission.deniedForever) {
      // Jika izin lokasi tetap ditolak, maka keluar dari aplikasi
      exit(0);
    }
  }

  @override
  void initState() {
    super.initState();
    requestLocationPermission(); // Meminta izin lokasi pada saat inisialisasi MainScreen
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
