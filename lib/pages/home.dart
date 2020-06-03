import 'package:flutter/material.dart';
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

class WorkoutList extends StatelessWidget {
  final workouts = <Workout>[
    Workout(
        title: "Test1", author: 'I1', description: 'Test1', level: "Beginner"),
    Workout(
        title: "Test2", author: 'I2', description: 'Test2', level: "Advanced"),
    Workout(
        title: "Test3", author: 'I3', description: 'Test3', level: "Beginner"),
    Workout(
        title: "Test4",
        author: 'I4',
        description: 'Test4',
        level: "Intermediate"),
    Workout(
        title: "Test5", author: 'I5', description: 'Test5', level: "Beginner"),
  ];
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Container(
        child: ListView.builder(
            itemCount: workouts.length,
            itemBuilder: (context, i) {
              return Card(
                elevation: 2.0,
                margin: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                child: Container(
                  decoration:
                      BoxDecoration(color: Color.fromRGBO(50, 65, 85, 0.9)),
                  child: ListTile(
                    contentPadding: EdgeInsets.symmetric(horizontal: 10),
                    leading: Container(
                      padding: EdgeInsets.only(right: 12),
                      child: Icon(
                        Icons.fitness_center,
                        color: Theme.of(context).textTheme.title.color,
                      ),
                      decoration: BoxDecoration(
                        border: Border(
                            right: BorderSide(width: 1, color: Colors.white24)),
                      ),
                    ),
                    title: Text(
                      workouts[i].title,
                      style: TextStyle(
                          color: Theme.of(context).textTheme.title.color,
                          fontWeight: FontWeight.bold),
                    ),
                    trailing: Icon(
                      Icons.keyboard_arrow_right,
                      color: Theme.of(context).textTheme.title.color,
                    ),
                    subtitle: subtitle(context, workouts[i]),
                  ),
                ),
              );
            }),
      ),
    );
  }
}

Widget subtitle(BuildContext context, Workout workout) {
  var color = Colors.grey;
  double indicator = 0;

  switch (workout.level) {
    case 'Beginner':
      color = Colors.green;
      indicator = 0.33;
      break;
    case 'Intermediate':
      color = Colors.yellow;
      indicator = 0.66;
      break;
    case 'Advanced':
      color = Colors.red;
      indicator = 1;
      break;
  }

  return Row(
    children: <Widget>[
      Expanded(
        flex: 1,
        child: LinearProgressIndicator(
          backgroundColor: Theme.of(context).textTheme.title.color,
          value: indicator,
          valueColor: AlwaysStoppedAnimation(color),
        ),
      ),
      SizedBox(width: 10),
      Expanded(
          flex: 3,
          child: Text(
            workout.level,
            style: TextStyle(color: Theme.of(context).textTheme.title.color),
          )),
    ],
  );
}
