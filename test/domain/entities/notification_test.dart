import 'package:test/test.dart';
import 'package:news_app/domain/entities/notification.dart';

void main() {
  group('Notification Class Tests', () {
    // Dados de exemplo para testes
    const userId = 'user123';
    const notificationContent = 'New notification';
    final notificationTime = DateTime.now();
    const sentToDiscord = true;

    group('Notification toString Test', () {
      test('Should return a valid string representation', () {
        final notification = Notification(
          userId: 'user123',
          notificationContent: 'New notification',
          notificationTime: DateTime(2023, 1, 1),
          sentToDiscord: true,
        );

        final expectedString = 'Notification{ userId: user123, notificationContent: New notification, notificationTime: ${notification.notificationTime}, sentToDiscord: true,}';
        expect(notification.toString(), expectedString);
      });
    });

    // Teste para verificar a criação correta do objeto
    test('Should create a valid Notification object', () {
      var notification = Notification(
        userId: userId,
        notificationContent: notificationContent,
        notificationTime: notificationTime,
        sentToDiscord: sentToDiscord,
      );

      expect(notification.userId, userId);
      expect(notification.notificationContent, notificationContent);
      expect(notification.notificationTime, notificationTime);
      expect(notification.sentToDiscord, sentToDiscord);
    });

    // Teste para verificar a função copyWith
    test('copyWith should update the notification correctly', () {
      var notification = Notification(
        userId: userId,
        notificationContent: notificationContent,
        notificationTime: notificationTime,
        sentToDiscord: sentToDiscord,
      );

      var updatedNotification = notification.copyWith(notificationContent: 'Updated notification');
      var updatedNotification2 = notification.copyWith(userId: 'Updated notification');

      expect(updatedNotification.notificationContent, 'Updated notification');
      expect(updatedNotification2.userId, 'Updated notification');
      expect(updatedNotification.userId, notification.userId); // UserId deve permanecer o mesmo
    });

    // Teste para verificar a função toMap
    test('toMap should return a valid map', () {
      var notification = Notification(
        userId: userId,
        notificationContent: notificationContent,
        notificationTime: notificationTime,
        sentToDiscord: sentToDiscord,
      );

      var notificationMap = notification.toMap();

      expect(notificationMap, isA<Map<String, dynamic>>());
      expect(notificationMap['userId'], notification.userId);
      expect(notificationMap['notificationContent'], notification.notificationContent);
    });

    // Teste para verificar a função fromMap
    test('fromMap should create a valid notification object', () {
      var notificationMap = {
        'userId': userId,
        'notificationContent': notificationContent,
        'notificationTime': notificationTime,
        'sentToDiscord': sentToDiscord,
      };

      var notification = Notification.fromMap(notificationMap);

      expect(notification, isA<Notification>());
      expect(notification.userId, notificationMap['userId']);
      expect(notification.notificationContent, notificationMap['notificationContent']);
    });

    // Teste para verificar as funções de igualdade e hashCode
    test('Notification comparison and hashCode should work correctly', () {
      var notification1 = Notification(
        userId: userId,
        notificationContent: notificationContent,
        notificationTime: notificationTime,
        sentToDiscord: sentToDiscord,
      );

      var notification2 = Notification(
        userId: userId,
        notificationContent: notificationContent,
        notificationTime: notificationTime,
        sentToDiscord: sentToDiscord,
      );

      expect(notification1, notification2);
      expect(notification1.hashCode, notification2.hashCode);
    });
    test('props should return the correct list of properties for Notification', () {
      final notificationTime = DateTime.now();
      final notification = Notification(
        userId: 'user123',
        notificationContent: 'New notification',
        notificationTime: notificationTime,
        sentToDiscord: true,
      );

      expect(notification.props, equals([
        'user123',
        'New notification',
        notificationTime,
        true,
      ]));
    });
  });
}
