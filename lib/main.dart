import 'package:flutter/material.dart';
import 'package:pdm_entrega01/ui/page.dart';

void main() => runApp(MyApp());


class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primaryColor: Colors.purple,
      ),
      home: Jokenpo(),
    );
  }
}

