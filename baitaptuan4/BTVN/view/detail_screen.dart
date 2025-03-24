import 'package:flutter/material.dart';
import '../model/task_model.dart';

class DetailScreen extends StatelessWidget {
  final Task task;

  const DetailScreen({Key? key, required this.task}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Detail', style: TextStyle(color: Colors.blue, fontSize: 20, fontWeight: FontWeight.bold)),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.blue),
          onPressed: () => Navigator.pop(context),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.delete, color: Colors.red),
            onPressed: () {},
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(task.title, style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
            const SizedBox(height: 4),
            Text(task.description, style: const TextStyle(fontSize: 16, color: Colors.black54,),softWrap: true,),
            const SizedBox(height: 16),

            // Task Info
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: Colors.pink[100],
                borderRadius: BorderRadius.circular(12),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _buildTaskInfo(Icons.category, 'Category', task.category),
                  _buildTaskInfo(Icons.hourglass_empty, 'Status', task.status),
                  _buildTaskInfo(Icons.flag, 'Priority', task.priority),
                ],
              ),
            ),
            const SizedBox(height: 16),

            // Subtasks
            const Text('Subtasks', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            const SizedBox(height: 8),
            ...task.subtasks.map((subtask) => _buildSubtaskItem(subtask)).toList(),
            const SizedBox(height: 16),

            // Attachments
            const Text('Attachments', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            const SizedBox(height: 8),
            ...task.attachments.map((attachment) => _buildAttachmentItem(attachment.fileName)).toList(),
          ],
        ),
      ),
    );
  }

  Widget _buildTaskInfo(IconData icon, String label, String value) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Icon(icon, size: 28),
        const SizedBox(height: 4),
        Column(
          children: [
            Text(label, style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w500)),
            Text(value, style: const TextStyle(fontSize: 12, fontWeight: FontWeight.bold)),
          ],
        )
      ],
    );
  }

  Widget _buildSubtaskItem(Subtask subtask) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        children: [
          Checkbox(value: subtask.isCompleted, onChanged: (value) {}),
          Expanded(child: Text(subtask.title)),
        ],
      ),
    );
  }

  Widget _buildAttachmentItem(String filename) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.grey[200],
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        children: [
          const Icon(Icons.attach_file, color: Colors.black54),
          const SizedBox(width: 8),
          Text(filename, style: const TextStyle(fontSize: 14)),
        ],
      ),
    );
  }
}