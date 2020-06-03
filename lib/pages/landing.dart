import 'package:provider/provider.dart';
import 'package:train/models/user.dart';
import 'package:train/pages/auth.dart';
import 'package:train/pages/home.dart';
import 'package:flutter/material.dart';

class LandingPage extends StatelessWidget {
  const LandingPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final User user = Provider.of<User>(context);
    final bool isLoggedIn = user != null;
    return isLoggedIn ? HomePage() : AuthorizationPage();
  }
}
