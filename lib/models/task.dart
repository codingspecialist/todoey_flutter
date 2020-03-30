class Task {
  final String name;
  bool isDone;

  Task({this.name, this.isDone = false});

  void toggleDone(){
    isDone = !isDone; // 토글하는 법
  }
}