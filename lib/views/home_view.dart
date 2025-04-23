
import 'package:flutter/material.dart';
import '../controllers/notification_controller.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final _controller = NotificationController();

  @override
  void initState() {
    super.initState();
    _controller.hasNavigated = false;
    _controller.initNotifications(
      context: context,
      onMessage: (model) {
        debugPrint('Notification received: ${model.title}');
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Home')),
      body: const Center(child: Text('Waiting for notifications...')),
    );
  }
}
