import 'package:flutter/material.dart';
import 'package:weather/pages/homePage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {

    WidgetsFlutterBinding.ensureInitialized();

    return MaterialApp(
      title: 'weather',

      theme: ThemeData.light(),
      darkTheme: ThemeData.dark(),

      home: homePage(),
    );
  }
}
