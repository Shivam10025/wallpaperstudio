import 'package:flutter/material.dart';
import 'package:wallpaperstudio/views/home.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'WallPaperStudio',
      theme: ThemeData(
        primaryColor: Color(0xfff8f5f0)
      ),
      debugShowCheckedModeBanner: false,
      home: Home(),
    );
  }
}
