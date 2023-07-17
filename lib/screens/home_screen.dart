import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:mosiga_users/screens/banyak_masalah_screen.dart';
import 'package:mosiga_users/screens/bensin_screen.dart';
import 'package:mosiga_users/screens/comingsoon_screen.dart';
import 'package:mosiga_users/screens/derek_screen.dart';
import 'package:mosiga_users/screens/kunci_hilang_screen.dart';
import 'package:mosiga_users/screens/tambal_ban_screen.dart';
import '../global/global.dart';
import '../theme/theme.dart';
import 'login_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
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
                padding: const EdgeInsets.fromLTRB(24, 8, 24, 0),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Expanded(
                      flex: 1,
                      child: Container(
                        width: double.infinity,
                        height: double.infinity,
                        decoration: const BoxDecoration(),
                        child: Align(
                          alignment: Alignment.center,
                          child: Padding(
                            padding: const EdgeInsets.fromLTRB(18, 0, 18, 0),
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Container(
                                  width: 50,
                                  height: 50,
                                  decoration: BoxDecoration(
                                    color: darkTheme
                                        ? Colors.black
                                        : Colors.grey.shade200,
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
                                      Fluttertoast.showToast(
                                          msg: "Hallo..., Ata 👋");
                                    },
                                  ),
                                ),
                                const SizedBox(
                                  width: 10,
                                ),
                                Text(
                                  'Hey, Ata 👋',
                                  style: TextStyle(
                                    fontFamily: 'Poppins',
                                    color: darkTheme
                                        ? Colors.white
                                        : Colors.grey.shade900,
                                    fontSize: 18,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                const Spacer(),
                                Container(
                                  width: 50,
                                  height: 50,
                                  decoration: const BoxDecoration(
                                    shape: BoxShape.circle,
                                  ),
                                  child: IconButton(
                                    icon: Icon(
                                      Icons.logout_rounded,
                                      color: darkTheme
                                          ? Colors.white
                                          : Colors.black,
                                      size: 35,
                                    ),
                                    onPressed: () {
                                      _logout();
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
                        child: Container(
                          decoration: BoxDecoration(
                            color: darkTheme ? Colors.amber.shade400 : primary,
                            borderRadius: BorderRadius.circular(40),
                          ),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Flexible(
                                flex: 1,
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Expanded(
                                      child: Align(
                                        alignment: AlignmentDirectional(-1, 0),
                                        child: ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(8),
                                          child: Image.asset(
                                            'images/promopic.png',
                                            width: 300,
                                            height: 200,
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Flexible(
                                flex: 1,
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      8, 0, 8, 0),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'PROMO ',
                                        textAlign: TextAlign.start,
                                        style: TextStyle(
                                          fontFamily: 'Poppins',
                                          color: darkTheme
                                              ? Colors.black
                                              : Colors.white,
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      Text(
                                        'TAMBAL BAN',
                                        textAlign: TextAlign.start,
                                        style: TextStyle(
                                          fontFamily: 'Poppins',
                                          color: darkTheme
                                              ? Colors.black
                                              : Colors.white,
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      Divider(
                                        thickness: 0,
                                        color: Colors.transparent,
                                      ),
                                      Text(
                                        'Diskon 5rb untuk pengguna baru, \nKODE : USERMOSIGA',
                                        textAlign: TextAlign.start,
                                        style: TextStyle(
                                          fontFamily: 'Poppins',
                                          color: darkTheme
                                              ? Colors.black
                                              : Colors.white,
                                          fontSize: 12,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 14,
                    ),
                    Align(
                      alignment: Alignment.center,
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const SizedBox(
                            width: 10,
                          ),
                          Text(
                            'Layanan Kami',
                            style: TextStyle(
                              fontFamily: 'Poppins',
                              color: darkTheme ? Colors.white : Colors.black,
                              fontSize: 24,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Expanded(
                      flex: 3,
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(4, 4, 4, 0),
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
                                      GestureDetector(
                                        child: Container(
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
                                          child: Stack(
                                            children: [
                                              Align(
                                                alignment:
                                                    const AlignmentDirectional(
                                                        1, 1),
                                                child: Padding(
                                                  padding:
                                                      const EdgeInsetsDirectional
                                                          .fromSTEB(0, 0, 0, 0),
                                                  child: Image.asset(
                                                    'images/Tambal Ban.png',
                                                    width: double.infinity,
                                                    height: double.infinity,
                                                    fit: BoxFit.cover,
                                                  ),
                                                ),
                                              ),
                                              Align(
                                                alignment: AlignmentDirectional(
                                                    -1, -1),
                                                child: Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(22, 22, 0, 0),
                                                  child: Text(
                                                    'Tambal\nBan',
                                                    style: TextStyle(
                                                      height: 1.3,
                                                      fontFamily: 'Poppins',
                                                      color: darkTheme
                                                          ? Colors.black
                                                          : Colors.white,
                                                      fontSize: 24,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        onTap: () => Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  const TambalBan()),
                                        ),
                                      ),
                                      const SizedBox(height: 14),
                                      GestureDetector(
                                        child: Container(
                                          width: 100,
                                          height: 200,
                                          decoration: BoxDecoration(
                                            color: darkTheme
                                                ? Colors.amber.shade400
                                                : primary,
                                            borderRadius:
                                                BorderRadius.circular(24),
                                          ),
                                          child: Stack(
                                            children: [
                                              Align(
                                                alignment:
                                                    const AlignmentDirectional(
                                                        1, 1),
                                                child: Padding(
                                                  padding:
                                                      const EdgeInsetsDirectional
                                                          .fromSTEB(0, 0, 0, 0),
                                                  child: Image.asset(
                                                    'images/Bensin.png',
                                                    width: double.infinity,
                                                    height: double.infinity,
                                                    fit: BoxFit.cover,
                                                  ),
                                                ),
                                              ),
                                              Align(
                                                alignment: AlignmentDirectional(
                                                    -1, -1),
                                                child: Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(22, 22, 0, 0),
                                                  child: Text(
                                                    'Bensin\n',
                                                    style: TextStyle(
                                                      height: 1.3,
                                                      fontFamily: 'Poppins',
                                                      color: darkTheme
                                                          ? Colors.black
                                                          : Colors.white,
                                                      fontSize: 24,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        onTap: () => Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  const ComingSoonScreen()),
                                        ),
                                      ),
                                      SizedBox(
                                        height: 14,
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(
                                width:
                                    14), // Add spacing between the two Expanded widgets
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
                                      GestureDetector(
                                        child: Container(
                                          width: 100,
                                          height: 100,
                                          decoration: BoxDecoration(
                                            color: darkTheme
                                                ? Colors.amber.shade400
                                                : primary,
                                            borderRadius:
                                                BorderRadius.circular(24),
                                            shape: BoxShape.rectangle,
                                          ),
                                          child: Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Row(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                Column(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: [
                                                    Icon(
                                                      Icons
                                                          .add_circle_outline_rounded,
                                                      size: 42,
                                                      color: darkTheme
                                                          ? Colors.black
                                                          : Colors.white,
                                                    ),
                                                  ],
                                                ),
                                                SizedBox(
                                                  width: 8,
                                                ),
                                                Column(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: [
                                                    Text(
                                                      'Ada \nLagi ?',
                                                      style: TextStyle(
                                                        height: 1.1,
                                                        fontFamily: 'Poppins',
                                                        color: darkTheme
                                                            ? Colors.black
                                                            : Colors.white,
                                                        fontSize: 18,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                        onTap: () => Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  const ComingSoonScreen()),
                                        ),
                                      ),
                                      const SizedBox(height: 14),
                                      GestureDetector(
                                        child: Container(
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
                                          child: Stack(
                                            children: [
                                              Align(
                                                alignment:
                                                    const AlignmentDirectional(
                                                        1, 1),
                                                child: Padding(
                                                  padding:
                                                      const EdgeInsetsDirectional
                                                          .fromSTEB(0, 0, 0, 0),
                                                  child: Image.asset(
                                                    'images/Derek.png',
                                                    width: double.infinity,
                                                    height: double.infinity,
                                                    fit: BoxFit.cover,
                                                  ),
                                                ),
                                              ),
                                              Align(
                                                alignment: AlignmentDirectional(
                                                    -1, -1),
                                                child: Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(22, 22, 0, 0),
                                                  child: Text(
                                                    'Derek',
                                                    style: TextStyle(
                                                      height: 1.3,
                                                      fontFamily: 'Poppins',
                                                      color: darkTheme
                                                          ? Colors.black
                                                          : Colors.white,
                                                      fontSize: 24,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        onTap: () => Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  const ComingSoonScreen()),
                                        ),
                                      ),
                                      const SizedBox(height: 14),
                                      GestureDetector(
                                        child: Container(
                                          width: 100,
                                          height: 250,
                                          decoration: BoxDecoration(
                                            color: darkTheme
                                                ? Colors.amber.shade400
                                                : primary,
                                            borderRadius:
                                                BorderRadius.circular(24),
                                          ),
                                          child: Stack(
                                            children: [
                                              Align(
                                                alignment:
                                                    const AlignmentDirectional(
                                                        1, 1),
                                                child: Padding(
                                                  padding:
                                                      const EdgeInsetsDirectional
                                                          .fromSTEB(0, 0, 0, 0),
                                                  child: Image.asset(
                                                    'images/Kunci.png',
                                                    width: double.infinity,
                                                    height: double.infinity,
                                                    fit: BoxFit.cover,
                                                  ),
                                                ),
                                              ),
                                              Align(
                                                alignment: AlignmentDirectional(
                                                    -1, -1),
                                                child: Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(22, 22, 0, 0),
                                                  child: Text(
                                                    'Kunci\nHilang',
                                                    style: TextStyle(
                                                      height: 1.3,
                                                      fontFamily: 'Poppins',
                                                      color: darkTheme
                                                          ? Colors.black
                                                          : Colors.white,
                                                      fontSize: 24,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        onTap: () => Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  const ComingSoonScreen()),
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 14,
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
