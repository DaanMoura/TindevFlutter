import 'package:app_tindev/ui/login.dart';
import 'package:flutter/material.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(primarySwatch: Colors.deepOrange),
        home: Scaffold(
          body: Login(),
        ),
      );
  }
}