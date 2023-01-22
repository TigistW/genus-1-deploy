import 'package:splashscreen/splashscreen.dart';
import 'package:flutter/material.dart';
import 'package:genus_frontend/home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          // This is the theme of your application.
          //
          // Try running your application with "flutter run". You'll see the
          // application has a blue toolbar. Then, without quitting the app, try
          // changing the primarySwatch below to Colors.green and then invoke
          // "hot reload" (press "r" in the console where you ran "flutter run",
          // or simply save your changes to "hot reload" in a Flutter IDE).
          // Notice that the counter didn't reset back to zero; the application
          // is not restarted.
          primarySwatch: Colors.blue,
        ),
        home: SplashScreen(
            seconds: 10,
            navigateAfterSeconds: MyHomePage(title: 'Flutter Demo Home Page'),
            image: new Image.asset(
              'assets/genus_blue.gif',
            ),
            // title: new Text(
            //   'SplashScreen Example',
            //   style: new TextStyle(
            //       fontWeight: FontWeight.bold,
            //       fontSize: 20.0,
            //       color: Color(0xffD61616)),
            // ),
            photoSize: 100.0,
            backgroundColor: Color(0xff011828),
            styleTextUnderTheLoader: new TextStyle(),
            loaderColor: Color(0xff1DACAE)));
  }
}
