import 'package:test/test.dart';
import 'package:news_app/domain/entities/user.dart';
import 'package:news_app/domain/entities/notification_settings.dart';

void main() {
  group('User Class Tests', () {
    // Dados de exemplo para testes
    const id = 'user123';
    const username = 'john_doe';
    const email = 'john@example.com';
    final preferences = ['Tech', 'Politics'];
    const notificationSettings = NotificationSettings(enableEmailNotifications: true, enablePushNotifications: false, enableDiscordNotifications: true);

    group('User toString Test', () {
      test('Should return a valid string representation', () {
        const user = User(
          id: 'user123',
          username: 'john_doe',
          email: 'john@example.com',
          preferences: ['Tech', 'Politics'],
          notificationSettings: NotificationSettings(
            enableEmailNotifications: true,
            enablePushNotifications: false,
            enableDiscordNotifications: true,
          ),
        );

        expect(user.toString(), 'User{ id: user123, username: john_doe, email: john@example.com, preferences: [Tech, Politics], notificationSettings: NotificationSettings{ enableEmailNotifications: true, enablePushNotifications: false, enableDiscordNotifications: true,},}');
      });
    });
    // Teste para verificar a criação correta do objeto
    test('Should create a valid User object', () {
      var user = User(
        id: id,
        username: username,
        email: email,
        preferences: preferences,
        notificationSettings: notificationSettings,
      );

      expect(user.id, id);
      expect(user.username, username);
      expect(user.email, email);
      expect(user.preferences, preferences);
      expect(user.notificationSettings, notificationSettings);
    });

    // Teste para verificar a função copyWith
    test('copyWith should update the user correctly', () {
      var user = User(
        id: id,
        username: username,
        email: email,
        preferences: preferences,
        notificationSettings: notificationSettings,
      );

      User updatedUser = user.copyWith(username: 'jane_doe');
      User updatedUser2 = user.copyWith(id: '1');

      expect(updatedUser.username, 'jane_doe');
      expect(updatedUser.email, user.email);

      expect(updatedUser2.id,'1' );
      expect(updatedUser2.email,'john@example.com');

    });

    // Teste para verificar a função toMap
    test('toMap should return a valid map', () {
      var user = User(
        id: id,
        username: username,
        email: email,
        preferences: preferences,
        notificationSettings: notificationSettings,
      );

      var userMap = user.toMap();

      expect(userMap, isA<Map<String, dynamic>>());
      expect(userMap['id'], user.id);
      expect(userMap['username'], user.username);
    });

    // Teste para verificar a função fromMap
    test('fromMap should create a valid user object', () {
      var userMap = {
        'id': id,
        'username': username,
        'email': email,
        'preferences': preferences,
        'notificationSettings': notificationSettings,
      };

      var user = User.fromMap(userMap);

      expect(user, isA<User>());
      expect(user.id, userMap['id']);
      expect(user.username, userMap['username']);
    });

    // Teste para verificar as funções de igualdade e hashCode
    test('User comparison and hashCode should work correctly', () {
      var user1 = User(
        id: id,
        username: username,
        email: email,
        preferences: preferences,
        notificationSettings: notificationSettings,
      );

      var user2 = User(
        id: id,
        username: username,
        email: email,
        preferences: preferences,
        notificationSettings: notificationSettings,
      );

      expect(user1, user2);
      expect(user1.hashCode, user2.hashCode);
    });
    test('props should return the correct list of properties for Notification', ()
    {
      final notification = User(
        id: id,
        username: username,
        email: email,
        preferences: preferences,
        notificationSettings: notificationSettings,
      );

      expect(notification.props, equals([
        id,
        username,
        email,
        preferences,
        notificationSettings,
      ]));
    });
  });
}
