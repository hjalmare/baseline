import 'package:flutter/material.dart';
import 'package:flutter_application_1/edit_skill_state.dart';
import 'package:flutter_application_1/skill_selection.dart';
import 'package:provider/provider.dart';

import 'skill_card.dart';

class Banana extends StatefulWidget {
  const Banana({Key? key}) : super(key: key);

  @override
  State<Banana> createState() => _BananaState();
}

class _BananaState extends State<Banana> {
  @override
  Widget build(BuildContext context) {
    return Consumer<SkillSelection>(builder: (context, skills, child) {
      void _btnPress() {
        print("object");
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => EditSkillScaffold()),
        );
      }

      return Row(
        children: [
          const Text("mooo"),
          Expanded(
            child: ListView.builder(
                itemCount: skills.selection.length,
                itemBuilder: (context, index) {
                  return SkillCard(skill: skills.selection[index]);
                }),
          ),
          TextButton(onPressed: _btnPress, child: Text("wth"))
        ],
      );
    });
  }
}
