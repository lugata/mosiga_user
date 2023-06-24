import 'package:flutter/material.dart';

class TambalBan extends StatefulWidget {
  const TambalBan({super.key});

  @override
  State<TambalBan> createState() => _TambalBanState();
}

class _TambalBanState extends State<TambalBan> {
  @override
  Widget build(BuildContext context) {
    bool darkTheme =
        MediaQuery.of(context).platformBrightness == Brightness.dark;
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        backgroundColor: darkTheme ? Colors.grey.shade900 : Colors.white,
        body: const SafeArea(child: Text("Ini Tambal Ban Page")),
      ),
    );
  }
}
