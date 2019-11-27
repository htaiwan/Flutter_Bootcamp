// 抽象class, 定義規範
abstract class Bloc {
  // streams is that they need to be closed when they are no longer needed,
  // otherwise it can cause a memory leak.
  // The dispose method is where the app will check for this.
  void dispose();
}
