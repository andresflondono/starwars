import 'package:flutter/material.dart';
import 'package:starwars/ui/theme/theme.dart';

import 'ui/screens/home_screen.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: MyTheme.theme,
      title: 'Star Wars API',
      color: Colors.black,
      home: const HomePage(),
    );
  }
}
