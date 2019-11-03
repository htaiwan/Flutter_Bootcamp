void main() {
  performTask();
}

void performTask() async {
  task1();
  String task = await task2();
  task3(task);
}

void task1() {
  String result1 = "data1 task";
  print("task1 complete");
}

Future task2() async {
  Duration duration = Duration(seconds: 3);

  String result2;
  await Future.delayed(duration, () {
    result2 = "data2 task";
    print("task2 complete");
  });

  return result2;
}

void task3(String str) {
  String result3 = "data3 task";
  print("task3 complete - $str");
}
