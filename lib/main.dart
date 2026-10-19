import 'package:basics/home/home_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomeScreen(),

      // debugShowCheckedModeBanner: false,
      // initialRoute: FacebookScreen.routeName,
      // routes: {
      //   FacebookScreen.routeName:(_) =>FacebookScreen(),
      // initialRoute: WhatsappScreen.routeName,
      // routes: {
      //   WhatsappScreen.routeName:(_) =>WhatsappScreen(),
      // },
      // initialRoute: PlayerScreen.routeName,
      // routes: {
      //   PlayerScreen.routeName: (_) => PlayerScreen(),
      //   GameScreenBoard.routeName: (_) => GameScreenBoard(),
      // },
    );
  }
}
