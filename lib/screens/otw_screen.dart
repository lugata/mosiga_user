import 'package:flutter/material.dart';
import 'package:mosiga_users/screens/rating_screen.dart';
import 'package:mosiga_users/theme/theme.dart';

class OtwScreen extends StatefulWidget {
  const OtwScreen({super.key});

  @override
  State<OtwScreen> createState() => _OtwScreenState();
}

class _OtwScreenState extends State<OtwScreen> {
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
              Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Align(
                    alignment: AlignmentDirectional(0, 0),
                    child: Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(22, 14, 22, 14),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Expanded(
                            child: Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(0, 0, 0, 18),
                              child: Container(
                                width: double.infinity,
                                height: 300,
                                decoration: BoxDecoration(
                                  color: darkTheme ? bg2 : Colors.white,
                                  boxShadow: [
                                    BoxShadow(
                                      blurRadius: 4,
                                      color: darkTheme
                                          ? const Color.fromARGB(
                                              51, 255, 255, 255)
                                          : const Color(0x33000000),
                                      offset: const Offset(5, 3),
                                      spreadRadius: 2,
                                    ),
                                  ],
                                  borderRadius: BorderRadius.circular(48),
                                ),
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0, 18, 0, 18),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Expanded(
                                        flex: 2,
                                        child: Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  18, 0, 18, 0),
                                          child: Row(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            children: [
                                              ClipRRect(
                                                borderRadius:
                                                    BorderRadius.circular(8),
                                                child: Image.asset(
                                                  'images/FotoProfil.png',
                                                  width: 80,
                                                  height: 80,
                                                  fit: BoxFit.cover,
                                                ),
                                              ),
                                              SizedBox(width: 20),
                                              Flexible(
                                                child: Column(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Text(
                                                      'Nama Nama',
                                                      style: TextStyle(
                                                        fontFamily: 'Poppins',
                                                        fontSize: 20,
                                                        fontWeight:
                                                            FontWeight.w500,
                                                      ),
                                                    ),
                                                    Text(
                                                      'Dalam Perjalanan',
                                                      style: TextStyle(
                                                        fontFamily: 'Poppins',
                                                        fontSize: 14,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                      SizedBox(height: 8),
                                      Flexible(
                                        flex: 1,
                                        child: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Icon(
                                              Icons.star_rounded,
                                              color: Color(0xFFFFCA2F),
                                              size: 32,
                                            ),
                                            Icon(
                                              Icons.star_rounded,
                                              color: Color(0xFFFFCA2F),
                                              size: 32,
                                            ),
                                            Icon(
                                              Icons.star_rounded,
                                              color: Color(0xFFFFCA2F),
                                              size: 32,
                                            ),
                                            Icon(
                                              Icons.star_rounded,
                                              color: Color(0xFFFFCA2F),
                                              size: 32,
                                            ),
                                            Icon(
                                              Icons.star_border_rounded,
                                              color: Color(0xFFFFCA2F),
                                              size: 32,
                                            ),
                                          ],
                                        ),
                                      ),
                                      SizedBox(height: 8),
                                      Expanded(
                                        flex: 1,
                                        child: Padding(
                                          padding:
                                              EdgeInsets.fromLTRB(24, 0, 24, 0),
                                          child: ElevatedButton(
                                            onPressed: () {},
                                            style: ElevatedButton.styleFrom(
                                              minimumSize:
                                                  Size(double.infinity, 50),
                                              padding: EdgeInsets.fromLTRB(
                                                  0, 0, 0, 0),
                                              shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(24),
                                              ),
                                              primary: Color(0xFF1FAF38),
                                            ),
                                            child: Text(
                                              'Chat Sekarang',
                                              style: TextStyle(
                                                fontFamily: 'Poppins',
                                                color: Colors.white,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                      SizedBox(height: 8),
                                      Expanded(
                                        flex: 1,
                                        child: Padding(
                                          padding:
                                              EdgeInsets.fromLTRB(24, 0, 24, 0),
                                          child: ElevatedButton(
                                            onPressed: () {
                                              Navigator.pushReplacement(
                                                context,
                                                MaterialPageRoute(
                                                    builder: (context) =>
                                                        const RatingScreen()),
                                              );
                                            },
                                            style: ElevatedButton.styleFrom(
                                              minimumSize:
                                                  Size(double.infinity, 50),
                                              padding: EdgeInsets.fromLTRB(
                                                  0, 0, 0, 0),
                                              shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(24),
                                              ),
                                              primary: primary,
                                            ),
                                            child: Text(
                                              'Selesaikan Pesanan',
                                              style: TextStyle(
                                                fontFamily: 'Poppins',
                                                color: Colors.white,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
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
            ],
          ),
        ),
      ),
    );
  }
}
