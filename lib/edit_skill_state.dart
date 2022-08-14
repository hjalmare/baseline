import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:uuid/uuid.dart';
import 'skill_selection.dart';
import 'skill.dart';

class EditSkillScaffold extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Second Route'),
      ),
      body: Center(
        child: EditSkill(),
      ),
    );
  }
}

class EditSkill extends StatefulWidget {
  const EditSkill({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return EditSkillState();
  }
}

class EditSkillState extends State<EditSkill> {
  final _formKey = GlobalKey<FormState>();
  String nameStr = "";
  String typeSelection = "asd";
  LoadType load = LoadType.kg;
  String loadStr = "";
  QuantityType quantity = QuantityType.reps;
  String quantityStr = "";

  @override
  Widget build(BuildContext context) {
    return Consumer<SkillSelection>(builder: (context, skills, child) {
      return Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextFormField(
                decoration: const InputDecoration(labelText: "Skill Name"),
                onChanged: (value) => nameStr = value,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Plz enter a name";
                  } else {
                    return null;
                  }
                },
              ),
              Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
                Expanded(
                    child: TextFormField(
                  decoration: const InputDecoration(labelText: "Load"),
                  keyboardType:
                      const TextInputType.numberWithOptions(decimal: true),
                  inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                  onChanged: (value) => loadStr = value,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Plz enter a load";
                    } else {
                      return null;
                    }
                  },
                )),
                Expanded(
                  child: DropdownButtonFormField<LoadType>(
                    value: load,
                    items: LoadType.values
                        .map((e) => DropdownMenuItem(
                            child: Text(loadTypeToStr(e)), value: e))
                        .toList(growable: false),
                    onChanged: (value) => print(value),
                  ),
                )
              ]),
              Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
                Expanded(
                    child: TextFormField(
                  decoration: const InputDecoration(labelText: "Quantity"),
                  keyboardType:
                      const TextInputType.numberWithOptions(decimal: true),
                  inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                  onChanged: (value) => quantityStr = value,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Plz enter a quantity";
                    } else {
                      return null;
                    }
                  },
                )),
                Expanded(
                  child: DropdownButtonFormField<QuantityType>(
                    value: quantity,
                    items: QuantityType.values
                        .map((e) => DropdownMenuItem(
                              value: e,
                              child: Text(quatityTypeToStr(e)),
                            ))
                        .toList(growable: false),
                    onChanged: (value) => print(value),
                  ),
                )
              ]),
              ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      print(loadStr);
                      Skill skill = Skill(
                          Uuid().v4obj(),
                          nameStr,
                          int.parse(loadStr),
                          load,
                          int.parse(quantityStr),
                          quantity);
                      skills.add(skill);
                      Navigator.pop(context);
                    }
                  },
                  child: const Text("Submit"))
            ],
          ));
    });
  }
}
