class Task {
  String title;
  bool isCompleted;
  DateTime reminderTime;

  Task({
    required this.title, 
    this.isCompleted = false, 
    required this.reminderTime,
  });
}