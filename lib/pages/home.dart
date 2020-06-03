import 'package:flutter/material.dart';
import 'package:train/components/workout-list.dart';
import 'package:train/models/workouts.dart';
import 'package:train/services/auth.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        backgroundColor: Theme.of(context).primaryColor,
        appBar: AppBar(
          title: Text('MaxFit'),
          leading: Icon(Icons.fitness_center),
          actions: <Widget>[
            FlatButton.icon(
              onPressed: () {
                AuthService().logOut();
              },
              icon: Icon(
                Icons.supervised_user_circle,
                color: Colors.white,
              ),
              label: SizedBox.shrink(),
            ),
          ],
        ),
        body: WorkoutList(),
      ),
    );
  }
}
