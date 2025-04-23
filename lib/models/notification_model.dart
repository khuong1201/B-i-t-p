
import 'package:firebase_messaging/firebase_messaging.dart';

class NotificationModel {
  final String? title;
  final String? body;
  final String? token;
  final Map<String, dynamic>? data;

  NotificationModel({this.title, this.body, this.token, this.data});

  factory NotificationModel.fromMessage(RemoteMessage message) {
    final notification = message.notification;
    final data = message.data;
    return NotificationModel(
      title: notification?.title ?? data['title'] as String? ?? 'Untitled',
      body: notification?.body ?? data['body'] as String? ?? 'No content',
      token: data['token'] as String?,
      data: data,
    );
  }

  NotificationModel copyWith({String? token, Map<String, dynamic>? data}) {
    return NotificationModel(
      title: title,
      body: body,
      token: token ?? this.token,
      data: data ?? this.data,
    );
  }
}
