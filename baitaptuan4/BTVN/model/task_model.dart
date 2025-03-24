class Task {
  final int? id;
  final String title;
  final String description;
  final String status; // 'Pending', 'In Progress', 'Completed'
  final String priority;
  final String category; // 'Work', 'Fitness', etc.
  final String dueDate;
  final String createdAt;
  final String updatedAt;
  final List<Subtask> subtasks;
  final List<Attachment> attachments;
  final List<Reminder> reminders;
  bool isCompleted;

  Task({
    this.id,
    required this.title,
    required this.description,
    required this.status,
    required this.priority,
    required this.category,
    required this.dueDate,
    required this.createdAt,
    required this.updatedAt,
    this.subtasks = const [],
    this.attachments = const [],
    this.reminders = const [],
    this.isCompleted = false,
  });
  bool get isInProgress => status == 'In Progress';
  // Create Task from a Map
  factory Task.fromMap(Map<String, dynamic> map) {
    return Task(
      id: map['id'],
      title: map['title'],
      description: map['description'],
      status: map['status'],
      priority: map['priority'] ?? 'Medium',
      category: map['category'],
      dueDate: map['dueDate'] ?? '',
      createdAt: map['createdAt'] ?? '',
      updatedAt: map['updatedAt'] ?? '',
      isCompleted: map['status'] == 'Completed',
      subtasks:
      map['subtasks'] != null
          ? List<Subtask>.from(
        map['subtasks'].map((x) => Subtask.fromMap(x)),
      )
          : [],
      attachments:
      map['attachments'] != null
          ? List<Attachment>.from(
        map['attachments'].map((x) => Attachment.fromMap(x)),
      )
          : [],
      reminders:
      map['reminders'] != null
          ? List<Reminder>.from(
        map['reminders'].map((x) => Reminder.fromMap(x)),
      )
          : [],
    );
  }

  // Format due date for display
  String getFormattedDueDate() {
    if (dueDate.isEmpty) return '';
    try {
      final dateTime = DateTime.parse(dueDate);
      return '${dateTime.hour.toString().padLeft(2, '0')}:00 ${dateTime.year}-${dateTime.month.toString().padLeft(2, '0')}-${dateTime.day.toString().padLeft(2, '0')}';
    } catch (e) {
      return dueDate;
    }
  }
}

class Subtask {
  final int id;
  final String title;
  bool isCompleted;

  Subtask({required this.id, required this.title, this.isCompleted = false});

  factory Subtask.fromMap(Map<String, dynamic> map) {
    return Subtask(
      id: map['id'],
      title: map['title'],
      isCompleted: map['isCompleted'] ?? false,
    );
  }
}

class Attachment {
  final int id;
  final String fileName;
  final String fileUrl;

  Attachment({required this.id, required this.fileName, required this.fileUrl});

  factory Attachment.fromMap(Map<String, dynamic> map) {
    return Attachment(
      id: map['id'],
      fileName: map['fileName'],
      fileUrl: map['fileUrl'],
    );
  }
}

class Reminder {
  final int id;
  final String time;
  final String type;

  Reminder({required this.id, required this.time, required this.type});

  factory Reminder.fromMap(Map<String, dynamic> map) {
    return Reminder(id: map['id'], time: map['time'], type: map['type']);
  }
}
