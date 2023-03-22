import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  var username;

  getPrefs() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      username = prefs.getString("name");
    });
  }

  deletePrefs() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    // prefs.remove("name");
    prefs.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Test'),
      ),
      body: Column(
        children: [
          Text("$username"),
          ElevatedButton(
              onPressed: () {
                getPrefs();
              },
              child: Text("Get Prefs")),
          ElevatedButton(
              onPressed: () {
                deletePrefs();
              },
              child: Text("Delete Prefs")),
        ],
      ),
    );
  }
}
