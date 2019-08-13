import 'package:app_tindev/src/blocs/AppBloc.dart';
import 'package:app_tindev/src/ui/login_page.dart';
import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:flutter/material.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      blocs: [
        Bloc((i) => BaseController()),
      ],
      child: MaterialApp(
        theme: ThemeData(primarySwatch: Colors.deepOrange, scaffoldBackgroundColor: Color(0xFFEEEEEE)),
        home: Scaffold(
          body: LoginPage(),
        ),
      ),
    );
  }
}
