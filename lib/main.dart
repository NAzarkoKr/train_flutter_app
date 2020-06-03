import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:train/models/user.dart';
import 'package:train/pages/landing.dart';
import 'package:train/services/auth.dart';

void main() => runApp(MaxFitApp());

class MaxFitApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamProvider<User>.value(
      value: AuthService().currentUser,
      child: MaterialApp(
        title: 'MaxFit',
        theme: ThemeData(
          primaryColor: Color.fromRGBO(50, 65, 85, 1),
          textTheme: TextTheme(title: TextStyle(color: Colors.white)),
        ),
        home: LandingPage(),
      ),
    );
  }
}
