import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:firebase_with_cloud_messaging/models/notification_model.dart';
import 'package:flutter/material.dart';
import 'views/home_view.dart';
import 'views/detail_view.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await FirebaseAnalytics.instance.setAnalyticsCollectionEnabled(true);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'FCM Demo',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const HomeScreen(),
      routes: {
        '/details': (context) {
          final notification = ModalRoute.of(context)!.settings.arguments as NotificationModel?;
          return DetailsScreen(notification: notification ?? NotificationModel());
        },
      },
    );
  }
}
