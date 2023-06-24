import 'package:flutter/material.dart';

class BensinPage extends StatefulWidget {
  const BensinPage({super.key});

  @override
  State<BensinPage> createState() => _BensinPageState();
}

class _BensinPageState extends State<BensinPage> {
  @override
  Widget build(BuildContext context) {
    bool darkTheme =
        MediaQuery.of(context).platformBrightness == Brightness.dark;
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        backgroundColor: darkTheme ? Colors.grey.shade900 : Colors.white,
        body: const SafeArea(child: Text("Ini Halaman Pengisian Bensin")),
      ),
    );
  }
}
