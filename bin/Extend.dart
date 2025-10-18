import './SpaceCraft.dart';

class Orbiter extends Spacecraft {
  double altitude;

  Orbiter(super.name, DateTime super.launchDate, super._a, this.altitude, );
}

void main(List<String> args) {
  var oribiter = Orbiter("123123", DateTime(2025), "asd", 0.0);
  print('${oribiter.launchDate}');
}