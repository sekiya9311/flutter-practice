import 'package:flutter/material.dart';
import 'package:flutter_practice/ui/RandomWords.dart';

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Startup Name Generator',
      theme: ThemeData(primaryColor: Colors.cyan),
      home: RandomWords(),
    );
  }
}
