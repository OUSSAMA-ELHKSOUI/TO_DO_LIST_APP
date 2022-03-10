class Task {
  Task({this.name, this.isChecked = false});
  final String name;
  bool isChecked;

  void changeBool() {
    isChecked = !isChecked;
  }
}
