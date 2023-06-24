import 'package:flutter/material.dart';

class KunciHilang extends StatefulWidget {
  const KunciHilang({super.key});

  @override
  State<KunciHilang> createState() => _KunciHilangState();
}

class _KunciHilangState extends State<KunciHilang> {
  @override
  Widget build(BuildContext context) {
    bool darkTheme =
        MediaQuery.of(context).platformBrightness == Brightness.dark;
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        backgroundColor: darkTheme ? Colors.grey.shade900 : Colors.white,
        body:
            const SafeArea(child: Text("Kunci Anda Hilang? Mosiga Solusinya")),
      ),
    );
  }
}
