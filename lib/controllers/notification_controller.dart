
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:firebase_with_cloud_messaging/models/notification_model.dart';
import 'package:firebase_with_cloud_messaging/views/detail_view.dart';
import 'package:firebase_with_cloud_messaging/views/home_view.dart';
import 'package:flutter/material.dart';

class NotificationController {
  final FirebaseMessaging _messaging = FirebaseMessaging.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  NotificationModel _model = NotificationModel();
  bool hasNavigated = false;

  NotificationModel get model => _model;

  Future<void> initNotifications({
    required BuildContext context,
    required Function(NotificationModel) onMessage,
  }) async {
    if (hasNavigated) return;

    try {
      // Yêu cầu quyền thông báo
      await _requestPermission();

      // Lấy và lưu token
      String? token = await _messaging.getToken();
      if (token != null) {
        _model = _model.copyWith(token: token);
        await _saveTokenToFirestore(token);
        debugPrint('FCM Token: $token');

      } else {
        debugPrint('Failed to get FCM token');
      }

      // Lắng nghe làm mới token
      _messaging.onTokenRefresh.listen((newToken) {
        _model = _model.copyWith(token: newToken);
        debugPrint('New FCM Token: $newToken');
        _saveTokenToFirestore(newToken);
      });

      // Xử lý thông báo foreground
      FirebaseMessaging.onMessage.listen((RemoteMessage message) {
        _model = NotificationModel.fromMessage(message);
        onMessage(_model);
        final route = message.data['route'] as String?;
        debugPrint('Foreground message: ${message.notification?.title ?? 'No title'}, route=$route');
        _showNotificationDialog(context, _model, route, message.data);
      });

      // Xử lý thông báo background
      FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
        if (hasNavigated) return;
        hasNavigated = true;
        _model = NotificationModel.fromMessage(message);
        onMessage(_model);
        final route = message.data['route'] as String?;
        debugPrint('Background message opened: route=$route, data=${message.data}');
        _navigateToDetails(context, _model, route, message.data);
      });

      // Xử lý thông báo khi ứng dụng terminated
      RemoteMessage? initialMessage = await _messaging.getInitialMessage();
      if (initialMessage != null && hasNavigated) {
        hasNavigated = true;
        _model = NotificationModel.fromMessage(initialMessage);
        onMessage(_model);
        final route = initialMessage.data['route'] as String?;
        debugPrint('Terminated message: route=$route, data=${initialMessage.data}');
        _navigateToDetails(context, _model, route, initialMessage.data);
      }
    } catch (e) {
      debugPrint('Error initializing notifications: $e');
    }
  }

  Future<void> _requestPermission() async {
    try {
      NotificationSettings settings = await _messaging.requestPermission(
        alert: true,
        badge: true,
        sound: true,
      );
      debugPrint('Permission status: ${settings.authorizationStatus}');
    } catch (e) {
      debugPrint('Error requesting permission: $e');
    }
  }

  Future<void> _saveTokenToFirestore(String token) async {
    try {
      // Kiểm tra xem token đã tồn tại trong Firestore chưa
      final querySnapshot = await _firestore
          .collection('devices')
          .where('fcm_token', isEqualTo: token)
          .get();

      if (querySnapshot.docs.isEmpty) {
        // Nếu token chưa tồn tại, tạo ID thiết bị mới và lưu vào Firestore
        String deviceId = DateTime.now().millisecondsSinceEpoch.toString();
        await _firestore.collection('devices').doc(deviceId).set({
          'fcm_token': token,
          'device_id': deviceId,
          'updated_at': FieldValue.serverTimestamp(),
        }, SetOptions(merge: true));
        debugPrint('Đã lưu token mới vào Firestore cho thiết bị: $deviceId');
      } else {
        debugPrint('Token đã tồn tại trong Firestore, không lưu lại');
      }
    } catch (e) {
      debugPrint('Lỗi khi lưu token vào Firestore: $e');
    }
  }

  void _showNotificationDialog(BuildContext context, NotificationModel notification, String? route, Map<String, dynamic> data) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(notification.title ?? 'Notification'),
        content: Text(notification.body ?? 'No content'),
        actions: data.isNotEmpty
            ? [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Close'),
          ),
          TextButton(
            onPressed: () {
              Navigator.pop(context);
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => DetailsScreen(notification: notification),
                ),
              );
            },
            child: const Text('View Details'),
          ),
        ]
            : [],
      ),
    );
  }

  void _navigateToDetails(BuildContext context, NotificationModel notification, String? route, Map<String, dynamic> data) {
    if (data.isNotEmpty && route == '/details') {
      Navigator.pushNamed(context, '/details', arguments: notification);
    } else {
      Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(builder: (context) => const HomeScreen()),
            (route) => false,
      );
    }
  }
}