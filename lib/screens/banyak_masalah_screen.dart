import 'package:flutter/material.dart';

class BanyakMasalah extends StatefulWidget {
  const BanyakMasalah({super.key});

  @override
  State<BanyakMasalah> createState() => _BanyakMasalahState();
}

class _BanyakMasalahState extends State<BanyakMasalah>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    bool darkTheme =
        MediaQuery.of(context).platformBrightness == Brightness.dark;
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        backgroundColor: darkTheme ? Colors.grey.shade900 : Colors.white,
        body: const SafeArea(
            child: Text("Ini Halaman Layanan ketika Anda banyak masalah")),
      ),
    );
  }
}
