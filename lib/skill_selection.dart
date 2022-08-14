import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:flutter_application_1/skill.dart';

class SkillSelection extends ChangeNotifier {
  final List<Skill> _selection = [];

  UnmodifiableListView<Skill> get selection => UnmodifiableListView(_selection);

  void add(Skill s) {
    _selection.add(s);
    print("Added Skill! " + s.toString());
    notifyListeners();
  }
}
