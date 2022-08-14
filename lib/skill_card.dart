import 'package:flutter/material.dart';
import 'skill.dart';

class SkillCard extends StatelessWidget {
  SkillCard({Key? key, required this.skill}) : super(key: key);

  Skill skill;
  @override
  Widget build(BuildContext context) {
    return Card(
        clipBehavior: Clip.antiAlias,
        child: InkWell(
          onTap: () => print("tap"),
          child: Column(children: [
            Text(skill.name),
            Row(
              children: [
                Text(skill.load.toString()),
                Text(loadTypeToStr(skill.loadType))
              ],
            ),
            Row(
              children: [
                Text(skill.quantity.toString()),
                Text(quatityTypeToStr(skill.quantityType))
              ],
            )
          ]),
        ));
  }
}
