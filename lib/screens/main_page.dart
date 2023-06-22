import 'package:flutter/material.dart';
import 'package:mosiga_users/screens/login_screen.dart';
import 'package:mosiga_users/theme/theme.dart';

import '../global/global.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  void _logout() async {
    await firebaseAuth.signOut();
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => const LoginScreen()),
    );
  }

  @override
  Widget build(BuildContext context) {
    bool darkTheme =
        MediaQuery.of(context).platformBrightness == Brightness.dark;
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        backgroundColor: darkTheme ? Colors.grey.shade900 : Colors.white,
        body: SafeArea(
          top: true,
          child: Stack(
            children: [
              Padding(
                padding: EdgeInsets.fromLTRB(24, 8, 24, 8),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Expanded(
                      flex: 1,
                      child: Container(
                        width: double.infinity,
                        height: double.infinity,
                        decoration: BoxDecoration(),
                        child: Align(
                          alignment: Alignment.center,
                          child: Padding(
                            padding: EdgeInsets.fromLTRB(18, 0, 18, 0),
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Container(
                                  width: 50,
                                  height: 50,
                                  decoration: BoxDecoration(
                                    color:
                                        Theme.of(context).secondaryHeaderColor,
                                    shape: BoxShape.circle,
                                  ),
                                  child: IconButton(
                                    icon: Icon(
                                      Icons.person_rounded,
                                      color: darkTheme
                                          ? Colors.white
                                          : Colors.black,
                                      size: 35,
                                    ),
                                    onPressed: () {
                                      print('IconButton pressed ...');
                                    },
                                  ),
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Text(
                                  'Hey, Ata 👋',
                                  style: TextStyle(
                                    fontFamily: 'Poppins',
                                    color: Colors.white,
                                    fontSize: 18,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                Spacer(),
                                Container(
                                  width: 50,
                                  height: 50,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                  ),
                                  child: IconButton(
                                    icon: Icon(
                                      Icons.notifications_rounded,
                                      color: darkTheme
                                          ? Colors.amber.shade400
                                          : primary,
                                      size: 35,
                                    ),
                                    onPressed: () {
                                      print('IconButton pressed ...');
                                    },
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 2,
                      child: Align(
                        alignment: Alignment.center,
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Expanded(
                              child: Align(
                                alignment: Alignment.center,
                                child: Container(
                                  width: double.infinity,
                                  height: double.infinity,
                                  decoration: BoxDecoration(
                                    color: darkTheme
                                        ? Colors.amber.shade400
                                        : primary,
                                    borderRadius: BorderRadius.circular(48),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    const Align(
                      alignment: Alignment.center,
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          SizedBox(
                            width: 10,
                          ),
                          Text(
                            'Layanan Kami',
                            style: TextStyle(
                              fontFamily: 'Poppins',
                              color: Colors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Expanded(
                      flex: 4,
                      child: Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Expanded(
                              flex: 1,
                              child: Align(
                                alignment: Alignment.centerLeft,
                                child: SingleChildScrollView(
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.stretch,
                                    children: [
                                      Container(
                                        width: 100,
                                        height: 250,
                                        decoration: BoxDecoration(
                                          color: darkTheme
                                              ? Colors.amber.shade400
                                              : primary,
                                          borderRadius:
                                              BorderRadius.circular(28),
                                          shape: BoxShape.rectangle,
                                        ),
                                      ),
                                      SizedBox(height: 18),
                                      Container(
                                        width: 100,
                                        height: 200,
                                        decoration: BoxDecoration(
                                          color: darkTheme
                                              ? Colors.amber.shade400
                                              : primary,
                                          borderRadius:
                                              BorderRadius.circular(24),
                                        ),
                                      ),
                                      SizedBox(height: 18),
                                      Container(
                                        width: 100,
                                        height: 150,
                                        decoration: BoxDecoration(
                                          color: darkTheme
                                              ? Colors.amber.shade400
                                              : primary,
                                          borderRadius:
                                              BorderRadius.circular(24),
                                          shape: BoxShape.rectangle,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                                width:
                                    18), // Add spacing between the two Expanded widgets
                            Expanded(
                              flex: 1,
                              child: Align(
                                alignment: Alignment.centerRight,
                                child: SingleChildScrollView(
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.stretch,
                                    children: [
                                      Container(
                                        width: 100,
                                        height: 200,
                                        decoration: BoxDecoration(
                                          color: darkTheme
                                              ? Colors.amber.shade400
                                              : primary,
                                          borderRadius:
                                              BorderRadius.circular(24),
                                          shape: BoxShape.rectangle,
                                        ),
                                      ),
                                      SizedBox(height: 18),
                                      Container(
                                        width: 100,
                                        height: 250,
                                        decoration: BoxDecoration(
                                          color: darkTheme
                                              ? Colors.amber.shade400
                                              : primary,
                                          borderRadius:
                                              BorderRadius.circular(24),
                                        ),
                                      ),
                                      SizedBox(height: 18),
                                      Container(
                                        width: 100,
                                        height: 150,
                                        decoration: BoxDecoration(
                                          color: darkTheme
                                              ? Colors.amber.shade400
                                              : primary,
                                          borderRadius:
                                              BorderRadius.circular(24),
                                          shape: BoxShape.rectangle,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: 20), // Add spacing after the Row
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
