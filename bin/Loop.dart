import 'package:basic/basic.dart';
import 'dart:core';
import 'dart:io' as io;

void main(List<String> args) {
  var flybyObjects = ['Jupiter', 'Saturn', 'Uranus', 'Neptune'];
  calculate();
  forTest(flybyObjects);
  print('------------------------');
  whileTest();
  print('------------------------');
  flybyObjects.where((name) => name.contains('Ne')).forEach(print);
}
enum PlanetType { terrestrial, gas, ice }
void forTest(List<String> flybyObjects) {
  for (final object in flybyObjects) {
    print('for object : $object');
    io.sleep(Duration(milliseconds: 250));
  }
}

void whileTest() {
  var count = 0;
  while (true) {
    print('while : $count');
    count++;
    if (count > 3) {
      return;
    }
    io.sleep(Duration(milliseconds: 250));
  }
}


