import 'package:basic/basic.dart' as basic;

void main(List<String> arguments) {
  print('package base calculate func : ${basic.calculate()}');
  Spacecraft? spacecraft;
  print('spacecraft : $spacecraft');
  spacecraft = Spacecraft("HeiYa", DateTime(1), "444");
  print('name is : ${spacecraft.name}');
  spacecraft.describe();
}

class Spacecraft {
  String _a;
  String _name;
  String get name => _name;
  DateTime? launchDate;

  int? get launcherYear => launchDate?.year;
  Spacecraft(this._name, this.launchDate, this._a);
  Spacecraft.unlaunched(String name) : this(name, null, "");

  void describe() {
    print('Spacecraft: $_name');
    var launchDate = this.launchDate;
    if (launchDate != null) {
      int years = DateTime.now().difference(launchDate).inDays ~/ 365;
      print('Launched : $launcherYear ( $years years ago)');
    } else {
      print('Unlaunched');
    }
  }
}
