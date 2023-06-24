import 'package:flutter/material.dart';

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
        body: const SafeArea(
            child: Text("Kendaraan anda butuh derek? mosiga solusinya")),
      ),
    );
  }
}
