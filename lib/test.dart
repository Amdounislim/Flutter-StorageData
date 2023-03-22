import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Test extends StatefulWidget {
  const Test({super.key});

  @override
  State<Test> createState() => _TestState();
}

class _TestState extends State<Test> {
  savePrefs() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString("name", "Slim");
    prefs.setString("email", "slim@gmail.com");
    prefs.setString("name", "Slim123456");
    print("succes");
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ElevatedButton(
            onPressed: () async {
              await savePrefs();
            },
            child: Text('Save Prefs')),
        Divider(
          height: 20,
        ),
        ElevatedButton(
            onPressed: () {
              Navigator.of(context).pushNamed("home");
            },
            child: Text("go to home page")),
      ],
    );
  }
}
