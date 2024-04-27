import 'package:flutter/material.dart';
import 'package:topomaps/pages/home.dart';
import 'package:topomaps/pages/danke.dart';
import 'package:topomaps/pages/info.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'topoMaps',
      home: home(),
      routes: {
        '/home': (context) => home(),
        '/info': (context) => info(),
        '/danke': (context) => danke(),
      },
    );
  }
}
