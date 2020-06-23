import 'package:flutter/material.dart';
import 'package:swipedetector/swipedetector.dart';

class ProfilePage extends StatefulWidget {
  ProfilePage({Key key, this.name, this.gender, this.email, this.age})
      : super(key: key);
  final String name;
  final String gender;
  final String email;
  final int age;

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return SwipeDetector(
      onSwipeRight: () => Navigator.pop(context),
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blueAccent,
          title: Text('Profile Page'),
        ),
        body: Padding(
          padding: const EdgeInsets.all(30.0),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Text(
                  'Name : ${widget.name}',
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.w700),
                ),
                SizedBox(
                  height: 20.0,
                ),
                Text(
                  'Gender : ${widget.gender}',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
                ),
                SizedBox(
                  height: 15.0,
                ),
                Text(
                  'Email : ${widget.email}',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
                ),
                SizedBox(
                  height: 15.0,
                ),
                Text(
                  'Age : ${widget.age}',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
