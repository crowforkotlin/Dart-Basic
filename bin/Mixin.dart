import './Enum.dart';
import './SpaceCraft.dart';

void main(List<String> args) {
  PilotedCraft("123", null, "12313").describeCrew();
}

class PilotedCraft extends Spacecraft with Piloted {
  PilotedCraft(super.name, super.launchDate, super.a);
}

mixin Piloted {
  int astronauts = 1;
  void describeCrew() {
    print('Number of astronauts: $astronauts');
  }
}