import 'package:flutter/material.dart';
import 'package:mosiga_users/theme/theme.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
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
                  padding: const EdgeInsetsDirectional.fromSTEB(22, 22, 22, 8),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Expanded(
                        flex: 1,
                        child: Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              8, 18, 8, 18),
                          child: Container(
                            width: 100,
                            height: 65,
                            decoration: BoxDecoration(
                              color:
                                  darkTheme ? Colors.amber.shade400 : primary,
                              boxShadow: const [
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
                              alignment: const AlignmentDirectional(-1, 0),
                              children: [
                                Align(
                                  alignment: const AlignmentDirectional(0, 0),
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
                        alignment: const AlignmentDirectional(0, 0),
                        child: Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              22, 0, 22, 14),
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
                                    borderRadius: BorderRadius.circular(18),
                                  ),
                                  child: Padding(
                                    padding:
                                        const EdgeInsetsDirectional.fromSTEB(
                                            14, 14, 14, 14),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(18),
                                          child: Image.asset(
                                            'images/FotoProfil.png',
                                            width: 68,
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                        Expanded(
                                          child: Padding(
                                            padding: const EdgeInsetsDirectional
                                                .fromSTEB(14, 0, 0, 0),
                                            child: Column(
                                              mainAxisSize: MainAxisSize.min,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.spaceAround,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Container(
                                                  width: double.infinity,
                                                  height: 60,
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
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    children: [
                                                      Text(
                                                        'Nama',
                                                        style: TextStyle(
                                                          color: darkTheme
                                                              ? Colors.black
                                                              : Colors.white,
                                                          fontFamily: 'Poppins',
                                                          fontSize: 18,
                                                          fontWeight:
                                                              FontWeight.w600,
                                                        ),
                                                      ),
                                                      Row(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        children: [
                                                          Icon(
                                                            Icons.star_rounded,
                                                            color: darkTheme
                                                                ? Colors.black
                                                                : Colors.white,
                                                            size: 24,
                                                          ),
                                                          Text(
                                                            '4.6',
                                                            maxLines: 1,
                                                            style: TextStyle(
                                                              color: darkTheme
                                                                  ? Colors.black
                                                                  : Colors
                                                                      .white,
                                                              fontFamily:
                                                                  'Poppins',
                                                              fontSize: 14,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .normal,
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                        Icon(
                                          Icons.chat_rounded,
                                          color: darkTheme
                                              ? Colors.black
                                              : Colors.white,
                                          size: 32,
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
              )
            ],
          ),
        ),
      ),
    );
  }
}
