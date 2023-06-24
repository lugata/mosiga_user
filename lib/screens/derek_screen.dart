import 'package:flutter/material.dart';

import '../theme/theme.dart';

class DerekPage extends StatefulWidget {
  const DerekPage({super.key});

  @override
  State<DerekPage> createState() => _DerekPageState();
}

class _DerekPageState extends State<DerekPage> {
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
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Flexible(
                    flex: 1,
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(22, 22, 22, 22),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Expanded(
                            child: Padding(
                              padding:
                                  const EdgeInsets.fromLTRB(14, 18, 14, 18),
                              child: Container(
                                width: 100,
                                height: 65,
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
                                  borderRadius: BorderRadius.circular(40),
                                  shape: BoxShape.rectangle,
                                ),
                                child: Stack(
                                  alignment: const AlignmentDirectional(-1, 0),
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.fromLTRB(
                                          14, 0, 0, 0),
                                      child: IconButton(
                                        onPressed: () {
                                          Navigator.pop(context);
                                        },
                                        icon: Icon(
                                          Icons.chevron_left_rounded,
                                          color: darkTheme
                                              ? Colors.white
                                              : Colors.black,
                                          size: 24,
                                        ),
                                      ),
                                    ),
                                    const Align(
                                      alignment: AlignmentDirectional(0, 0),
                                      child: Text(
                                        'Titik Insiden',
                                        style: TextStyle(
                                          fontSize: 18,
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
                  Align(
                    alignment: const AlignmentDirectional(0, 0),
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(22, 14, 22, 14),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Expanded(
                            child: Align(
                              alignment: const AlignmentDirectional(0, 0),
                              child: Padding(
                                padding: const EdgeInsets.fromLTRB(0, 0, 0, 18),
                                child: Container(
                                  width: double.infinity,
                                  height: 150,
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
                                  alignment: const AlignmentDirectional(0, 0),
                                  child: Padding(
                                    padding:
                                        const EdgeInsets.fromLTRB(0, 12, 0, 12),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        const Expanded(
                                          child: Align(
                                            alignment:
                                                AlignmentDirectional(0, 0),
                                            child: Text(
                                              'Titik Insiden',
                                              style: TextStyle(
                                                fontFamily: 'Poppins',
                                                fontSize: 18,
                                                fontWeight: FontWeight.w600,
                                              ),
                                            ),
                                          ),
                                        ),
                                        Expanded(
                                          child: Align(
                                            alignment:
                                                const AlignmentDirectional(
                                                    0, -1),
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.fromLTRB(
                                                      24, 0, 24, 8),
                                              child: ElevatedButton(
                                                onPressed: () {
                                                  print('Button pressed ...');
                                                },
                                                style: ElevatedButton.styleFrom(
                                                  primary: primary,
                                                  padding: EdgeInsets.zero,
                                                  elevation: 3,
                                                  shape: RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            24),
                                                  ),
                                                ),
                                                child: Ink(
                                                  decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            24),
                                                  ),
                                                  child: Container(
                                                    width: double.infinity,
                                                    height: 50,
                                                    alignment: Alignment.center,
                                                    child: const Text(
                                                      'Submit',
                                                      style: TextStyle(
                                                        fontFamily: 'Poppins',
                                                        color: Colors.white,
                                                        fontSize: 16,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                      ),
                                                    ),
                                                  ),
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
