import 'package:flutter/material.dart';
import 'package:mosiga_users/screens/home_screen.dart';
import 'package:mosiga_users/theme/theme.dart';

class RatingScreen extends StatefulWidget {
  const RatingScreen({super.key});

  @override
  State<RatingScreen> createState() => _RatingScreenState();
}

class _RatingScreenState extends State<RatingScreen> {
  int starRating = 0;
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
          child: Padding(
            padding: const EdgeInsets.all(38.0),
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 14),
                    child: Container(
                      width: 300,
                      height: 200,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(42),
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(8),
                        child: Image.asset(
                          'images/picrate.png',
                          width: 300,
                          height: 200,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                  Text(
                    'Rate your experience',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontFamily: 'Poppins',
                      fontSize: 38,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(0, 8, 0, 8),
                        child: InkWell(
                          onTap: () {
                            setState(() {
                              starRating = 1;
                            });
                          },
                          child: Icon(
                            starRating >= 1
                                ? Icons.star_rounded
                                : Icons.star_border_rounded,
                            color: darkTheme ? Colors.amber.shade400 : primary,
                            size: 52,
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(0, 8, 0, 8),
                        child: InkWell(
                          onTap: () {
                            setState(() {
                              starRating = 2;
                            });
                          },
                          child: Icon(
                            starRating >= 2
                                ? Icons.star_rounded
                                : Icons.star_border_rounded,
                            color: darkTheme ? Colors.amber.shade400 : primary,
                            size: 52,
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(0, 8, 0, 8),
                        child: InkWell(
                          onTap: () {
                            setState(() {
                              starRating = 3;
                            });
                          },
                          child: Icon(
                            starRating >= 3
                                ? Icons.star_rounded
                                : Icons.star_border_rounded,
                            color: darkTheme ? Colors.amber.shade400 : primary,
                            size: 52,
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(0, 8, 0, 8),
                        child: InkWell(
                          onTap: () {
                            setState(() {
                              starRating = 4;
                            });
                          },
                          child: Icon(
                            starRating >= 4
                                ? Icons.star_rounded
                                : Icons.star_border_rounded,
                            color: darkTheme ? Colors.amber.shade400 : primary,
                            size: 52,
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(0, 8, 0, 8),
                        child: InkWell(
                          onTap: () {
                            setState(() {
                              starRating = 5;
                            });
                          },
                          child: Icon(
                            starRating >= 5
                                ? Icons.star_rounded
                                : Icons.star_border_rounded,
                            color: darkTheme ? Colors.amber.shade400 : primary,
                            size: 52,
                          ),
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(0, 8, 0, 8),
                    child: Container(
                      width: 100,
                      height: 150,
                      decoration: BoxDecoration(
                          color:
                              darkTheme ? Colors.black : Colors.grey.shade200,
                          borderRadius: BorderRadius.circular(24)),
                      child: Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(12, 8, 12, 8),
                        child: Container(
                          width: double.infinity,
                          height: 34,
                          child: TextFormField(
                            maxLines: 5,
                            keyboardType: TextInputType.multiline,
                            decoration: InputDecoration(
                              hintText: "Ulasan ...",
                              hintStyle: const TextStyle(
                                color: Colors.grey,
                              ),
                              filled: true,
                              fillColor: darkTheme
                                  ? Colors.black45
                                  : Colors.grey.shade200,
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(40),
                                borderSide: const BorderSide(
                                  width: 0,
                                  style: BorderStyle.none,
                                ),
                              ),
                            ),
                            autovalidateMode:
                                AutovalidateMode.onUserInteraction,
                            validator: (text) {
                              return null;
                            },
                            onChanged: (text) => setState(() {}),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(0, 14, 0, 14),
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const HomeScreen(),
                          ),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        minimumSize: Size(double.infinity, 50),
                        padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(24),
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
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
