import 'package:flutter/material.dart';
import 'package:flutter_application_1/banana.dart';
import 'package:provider/provider.dart';
import 'edit_skill_state.dart';
import 'skill_selection.dart';

void main() {
  runApp(ChangeNotifierProvider(
      create: (context) => SkillSelection(), child: const MyApp()));
}

/*
Functions:
set goals (preset?)
update goal status (checkin)
excs suggestions
snacks

*/
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Skillz',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Skillz'),
        ),
        body: const Center(child: Banana()),
      ),
    );
  }
}
