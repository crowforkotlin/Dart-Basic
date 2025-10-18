import 'SpaceCraft.dart';
import 'dart:io';

import 'Loop.dart';

void main(List<String> args) {

  createDescriptions(["123"]);
// 调用 report 函数获取 Stream 对象
  Stream<String> stream = report(
      Spacecraft("天问一号", DateTime(2020, 7, 23), "CNSA"),
      ["月球", "火星", "木星"]
  );

  print('开始监听 stream...');

  // 2. 使用 await for 循环来消费 stream
  void t() async {
    await for (String event in stream) {
      // 每当 stream 发出一个新值，这里的代码就会执行一次
      print('接收到事件: $event');
    }
  }

  t();
  // 当 stream 关闭后（即 report 函数执行完毕），循环结束，会执行下面的代码
  print('Stream 监听结束。');
  return;

  const oneSecond = Duration(seconds: 1);
  Future<void> printWithDelay(String message) async {
    await Future.delayed(oneSecond);
    var count = 0;
    while(true) {
      count++;
      print('message : $count');
      await Future.delayed(oneSecond);
      if(count > 3) {
        break;
      }
    }
    print('end');
  }
  printWithDelay("Hello");
  printWithDelay("World");

  Future<void> printWithDelayed(String message) {
    return Future.delayed(Duration(seconds: 1)).then((_) {
      print(message);
    });
  }
  printWithDelayed("message wwwwwwwwwwwww");
  printWithDelayed("message ~~~~~~~~~~~~~~");
}

Future<void> createDescriptions(Iterable<String> objects) async {
  for (final object in objects) {
    try {
      var file = File('$object.txt');
      if (await file.exists()) {
        var modified = await file.lastModified();
        print(
          'File for $object already exists. It was modified on $modified.',
        );
        continue;
      }
      await file.create();
      await file.writeAsString('Start describing $object in this file.');
    } on IOException catch (e) {
      print('Cannot create description for $object: $e');
    }
  }
}

Stream<String> report(Spacecraft craft, Iterable<String> objects) async* {
  for (final object in objects) {
    await Future.delayed(Duration(seconds: 1));
    yield '${craft.name} flies by $object';
  }
}