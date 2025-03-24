import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../controller/task_controller.dart';
import '../model/task_model.dart';
import 'detail_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  void initState() {
    super.initState();
    // Load tasks when screen initializes
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Provider.of<TaskController>(context, listen: false).fetchTasks();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: Padding(
          padding: EdgeInsets.only(top: 10, left: 30),
          child: Image.asset(
            'assets/images/image 16.png',
          ),
        ),
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'SmartTasks',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.blue,
              ),
            ),
            const Text(
              'A simple and efficient to-do app',
              style: TextStyle(
                fontSize: 10,
                color: Colors.blue,
              ),
            ),
          ],
        ),
        actions: [
          IconButton(
            icon: Stack(
              clipBehavior: Clip.none,
              children: [
                const Icon(Icons.notifications, color: Colors.yellow, size: 40,),
                Positioned(
                  right: 0,
                  top: 0,
                  child: Container(
                    padding: const EdgeInsets.all(2),
                    decoration: BoxDecoration(
                      color: Colors.red,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    constraints: const BoxConstraints(
                      minWidth: 16,
                      minHeight: 16,
                    ),
                    child: const Text(
                      '3',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              ],
            ),
            onPressed: () {},
          ),
        ],
      ),
      body: Consumer<TaskController>(
        builder: (context, taskController, child) {
          if (taskController.isLoading) {
            return const Center(child: CircularProgressIndicator());
          }

          if (taskController.error != null) {
            return Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    'Error: ${taskController.error}',
                    style: const TextStyle(color: Colors.red),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 16),
                  ElevatedButton(
                    onPressed: () {
                      taskController.fetchTasks();
                    },
                    child: const Text('Retry'),
                  ),
                ],
              ),
            );
          }

          if (taskController.tasks.isEmpty) {
            return const Center(child: Text('No tasks found'));
          }

          return RefreshIndicator(
            onRefresh: () => taskController.fetchTasks(),
            child: ListView.builder(
              padding: const EdgeInsets.only(top: 8, bottom: 72),
              itemCount: taskController.tasks.length,
              itemBuilder: (context, index) {
                final task = taskController.tasks[index];
                return _buildTaskItem(context, task);
              },
            ),
          );
        },
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.calendar_today),
            label: 'Schedule',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.add_circle, size: 40, color: Colors.blue),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.insert_drive_file),
            label: 'Files',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Settings',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.grey,
        onTap: _onItemTapped,
        type: BottomNavigationBarType.fixed,
      ),
    );
  }

  Widget _buildTaskItem(BuildContext context, Task task) {
    Color backgroundColor;

    switch (task.category.toLowerCase()) {
      case 'work':
        backgroundColor = Colors.red.shade100;
        break;
      case 'fitness':
        backgroundColor = Colors.blue.shade100;
        break;
      default:
        backgroundColor = Colors.yellow.shade100;
    }
    String statusText;
    Color statusColor;

    if (task.isCompleted) {
      statusText = "Completed";
      statusColor = Colors.green;
    } else if (task.isInProgress) {
      statusText = "In Progress";
      statusColor = Colors.orange;
    } else {
      statusText = "Pending";
      statusColor = Colors.red;
    }
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => DetailScreen(task: task),
          ),
        );
      },
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 4, horizontal: 16),
        decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            children: [
              Icon(
                task.isCompleted ? Icons.check_box : Icons.check_box_outline_blank,
                color: task.isCompleted ? Colors.blue : Colors.grey,
              ),
              const SizedBox(width: 8),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      task.title,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                        color: Colors.black87,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      task.description,
                      style: const TextStyle(fontSize: 14, color: Colors.black54),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Status: $statusText',
                          style: TextStyle(
                            fontSize: 14,
                            color: statusColor,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        Text(
                          task.getFormattedDueDate(),
                          style: const TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                            color: Colors.black54,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}