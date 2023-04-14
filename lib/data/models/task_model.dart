class TaskModel {
  int? id;
  int? remind;
  String? title;
  String? note;
  String? startTime;
  String? endTime;
  String? date;
  String? repeat;

  TaskModel({
    this.remind,
    this.title,
    this.note,
    this.startTime,
    this.endTime,
    this.date,
    this.repeat,
    this.id,
  });
  factory TaskModel.fromMap(Map<String, dynamic> json) {
    return TaskModel(
      id:json['id'],
      remind: json['remind'],
      note: json['note'],
      startTime: json['startTime'],
      endTime: json['endTime'],
      date: json['date'],
      title: json['title'],
      repeat: json['repeat'],
    );
  }
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'remind': remind,
      'repeat': repeat,
      'title': title,
      'date': date,
      'startTime': startTime,
      'endTime': endTime,
      'note': note,
    };
  }
}
