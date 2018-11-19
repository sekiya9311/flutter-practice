import 'package:flutter/material.dart';
import 'package:flutter_practice/ui/RandomWords.dart';

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Welcome to Flutter',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Welcome to Flutter'),
        ),
        body: Center(
          //child: Text('Hello World'),
          child: RandomWords(),
        ),
      ),
    );
  }
}

