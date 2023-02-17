import 'package:flutter/material.dart';
import 'package:genus_frontend/screens/pages/AudioInputPage.dart';
import 'package:genus_frontend/screens/pages/record_page.dart';
import 'package:genus_frontend/screens/pages/splash_page.dart';
import 'package:genus_frontend/screens/pages/upload_music.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'My App',
      initialRoute: '/',
      routes: {
        '/': (context) => SplashPage(),
        '/home': (context) => AudioInputPage(),
        // '/record':(context)=> AudioRecorder()
      },
    );
  }
}
