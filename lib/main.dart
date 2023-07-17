import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:mosiga_users/infoHandler/app_info.dart';
import 'package:mosiga_users/splashScreens/splash_screen.dart';
import 'package:mosiga_users/theme/theme.dart';
import 'package:provider/provider.dart';

Future<void> main() async {
  runApp(const MyApp());

  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => AppInfo(),
      child: MaterialApp(
        title: 'Mosiga Demo',
        themeMode: ThemeMode.system,
        theme: MyThemes.lightTheme,
        darkTheme: MyThemes.darkTheme,
        debugShowCheckedModeBanner: false,
        home: SplashScreen(),
      ),
    );
  }
}
