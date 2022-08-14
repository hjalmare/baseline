import 'package:uuid/uuid.dart';

class Skill {
  final UuidValue id;
  final String name;
  final int load;
  final LoadType loadType;
  final int quantity;
  final QuantityType quantityType;

  const Skill(this.id, this.name, this.load, this.loadType, this.quantity,
      this.quantityType);

  String toString() {
    return "$name $load $loadType";
  }
}

enum LoadType { kg, minKm, bw }

String loadTypeToStr(LoadType lt) {
  switch (lt) {
    case LoadType.bw:
      return "Bodyweight";
    case LoadType.kg:
      return "KG";
    case LoadType.minKm:
      return "Min/KM";
  }
}

enum QuantityType { reps, km, seconds, minutes, hours }

String quatityTypeToStr(QuantityType qt) {
  switch (qt) {
    case QuantityType.reps:
      return "Repetitions";
    case QuantityType.km:
      return "KM";
    case QuantityType.hours:
      return "Hours";
    case QuantityType.minutes:
      return "Minutes";
    case QuantityType.seconds:
      return "Seconds";
  }
}
