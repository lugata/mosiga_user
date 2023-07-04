import 'package:flutter/material.dart';

import '../theme/theme.dart';

class HistoryScreen extends StatefulWidget {
  const HistoryScreen({super.key});

  @override
  State<HistoryScreen> createState() => _HistoryScreenState();
}

class _HistoryScreenState extends State<HistoryScreen> {
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
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Flexible(
                flex: 1,
                child: Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(22, 22, 22, 8),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Expanded(
                        flex: 1,
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(8, 18, 8, 18),
                          child: Container(
                            width: 100,
                            height: 65,
                            decoration: BoxDecoration(
                              color:
                                  darkTheme ? Colors.amber.shade400 : primary,
                              boxShadow: [
                                BoxShadow(
                                  blurRadius: 4,
                                  color: Color(0x33000000),
                                  offset: Offset(6, 6),
                                  spreadRadius: 3,
                                )
                              ],
                              borderRadius: BorderRadius.circular(40),
                              shape: BoxShape.rectangle,
                            ),
                            child: Stack(
                              alignment: AlignmentDirectional(-1, 0),
                              children: [
                                Align(
                                  alignment: AlignmentDirectional(0, 0),
                                  child: Text(
                                    'Riwayat Service',
                                    style: TextStyle(
                                      fontSize: 18,
                                      color: darkTheme
                                          ? Colors.black
                                          : Colors.white,
                                      fontFamily: 'Poppins',
                                      fontWeight: FontWeight.bold,
                                    ),
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
              Expanded(
                flex: 4,
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Align(
                        alignment: AlignmentDirectional(0, 0),
                        child: Padding(
                          padding:
                              EdgeInsetsDirectional.fromSTEB(22, 0, 22, 14),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Expanded(
                                child: Card(
                                  clipBehavior: Clip.antiAliasWithSaveLayer,
                                  color: darkTheme
                                      ? Colors.amber.shade400
                                      : primary,
                                  elevation: 4,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(28),
                                  ),
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        24, 24, 24, 24),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Column(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            Align(
                                              alignment:
                                                  AlignmentDirectional(1, 1),
                                              child: ClipRRect(
                                                borderRadius:
                                                    BorderRadius.circular(18),
                                                child: Container(
                                                  color: Colors.white,
                                                  child: Image.asset(
                                                    'images/Tambal Ban.png',
                                                    width: 90,
                                                    height: 90,
                                                    fit: BoxFit.cover,
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                        Expanded(
                                          child: Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    14, 0, 0, 0),
                                            child: Column(
                                              mainAxisSize: MainAxisSize.min,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.spaceAround,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Container(
                                                  width: double.infinity,
                                                  height: 50,
                                                  decoration: BoxDecoration(
                                                    color: darkTheme
                                                        ? Colors.amber.shade400
                                                        : primary,
                                                  ),
                                                  child: Column(
                                                    mainAxisSize:
                                                        MainAxisSize.min,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Flexible(
                                                        child: Text(
                                                          'Kab. Pasuruan',
                                                          style: TextStyle(
                                                            color: darkTheme
                                                                ? Colors.black
                                                                : Colors.white,
                                                            fontFamily:
                                                                'Poppins',
                                                            fontSize: 18,
                                                            fontWeight:
                                                                FontWeight.w600,
                                                          ),
                                                        ),
                                                      ),
                                                      Text(
                                                        'Sudah Selesai Diperbaiki',
                                                        style: TextStyle(
                                                          color: darkTheme
                                                              ? Colors.black
                                                              : Colors.white,
                                                          fontFamily: 'Poppins',
                                                          fontSize: 14,
                                                          fontWeight:
                                                              FontWeight.normal,
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                                SizedBox(
                                                  height: 10,
                                                ),
                                                Text(
                                                  '11 Juni 2023',
                                                  textAlign: TextAlign.start,
                                                  style: TextStyle(
                                                    color: darkTheme
                                                        ? Colors.black
                                                        : Colors.white,
                                                    fontFamily: 'Poppins',
                                                    fontSize: 14,
                                                    fontWeight:
                                                        FontWeight.normal,
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
                            ],
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
      ),
    );
  }
}
