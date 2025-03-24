import 'package:flutter/material.dart';
import '../model/task_model.dart';
import 'api_service.dart';

class TaskController extends ChangeNotifier {
  List<Task> _tasks = [];
  final ApiService _apiService = ApiService();
  bool _isLoading = false;
  String? _error;

  // Getters
  List<Task> get tasks => _tasks;
  bool get isLoading => _isLoading;
  String? get error => _error;

  // Get tasks by status
  List<Task> getTasksByStatus(String status) {
    return _tasks.where((task) => task.status == status).toList();
  }

  // Get tasks by category
  List<Task> getTasksByCategory(String category) {
    return _tasks.where((task) => task.category == category).toList();
  }

  // Fetch tasks from API
  Future<void> fetchTasks() async {
    _isLoading = true;
    _error = null;
    notifyListeners();

    try {
      _tasks = await _apiService.getTasks();
      _isLoading = false;
      notifyListeners();
    } catch (e) {
      _error = e.toString();
      _isLoading = false;
      notifyListeners();
    }
  }

  // Load initial data from API
  Future<void> loadInitialData() async {
    await fetchTasks();
  }
}
