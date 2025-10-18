import './SpaceCraft.dart';
class MockSpaceship implements Spacecraft {
  @override
  DateTime? launchDate;

  @override
  void describe() {
    print('desc');
  }

  @override
  // TODO: implement launcherYear
  int? get launcherYear => 2024;

  @override
  String get name => "123123";

}