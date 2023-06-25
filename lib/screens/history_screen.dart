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
                                  color: darkTheme
                                      ? Colors.amber.shade400
                                      : primary,
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
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
