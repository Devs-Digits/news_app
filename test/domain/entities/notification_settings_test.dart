import 'package:test/test.dart';
import 'package:news_app/domain/entities/notification_settings.dart';

void main() {
  group('NotificationSettings Class Tests', () {
    // Dados de exemplo para testes
    const enableEmailNotifications = true;
    const enablePushNotifications = false;
    const enableDiscordNotifications = true;

    group('NotificationSettings toString Test', () {
      test('Should return a valid string representation', () {
        const settings = NotificationSettings(
          enableEmailNotifications: true,
          enablePushNotifications: false,
          enableDiscordNotifications: true,
        );

        expect(settings.toString(), 'NotificationSettings{ enableEmailNotifications: true, enablePushNotifications: false, enableDiscordNotifications: true,}');
      });
    });

    // Teste para verificar a criação correta do objeto
    test('Should create a valid NotificationSettings object', () {
      var settings = const NotificationSettings(
        enableEmailNotifications: enableEmailNotifications,
        enablePushNotifications: enablePushNotifications,
        enableDiscordNotifications: enableDiscordNotifications,
      );

      expect(settings.enableEmailNotifications, enableEmailNotifications);
      expect(settings.enablePushNotifications, enablePushNotifications);
      expect(settings.enableDiscordNotifications, enableDiscordNotifications);
    });

    // Teste para verificar a função copyWith
    test('copyWith should update the settings correctly', () {
      var settings = const NotificationSettings(
        enableEmailNotifications: enableEmailNotifications,
        enablePushNotifications: enablePushNotifications,
        enableDiscordNotifications: enableDiscordNotifications,
      );

      var updatedSettings = settings.copyWith(enablePushNotifications: true);
      var updatedSettings2 = settings.copyWith(enableEmailNotifications: true);

      expect(updatedSettings.enablePushNotifications, true);
      expect(updatedSettings.enableEmailNotifications, settings.enableEmailNotifications); // enableEmailNotifications deve permanecer o mesmo
      expect(updatedSettings2.enableEmailNotifications, settings.enableEmailNotifications); // enableEmailNotifications deve permanecer o mesmo
    });

    // Teste para verificar a função toMap
    test('toMap should return a valid map', () {
      var settings = const NotificationSettings(
        enableEmailNotifications: enableEmailNotifications,
        enablePushNotifications: enablePushNotifications,
        enableDiscordNotifications: enableDiscordNotifications,
      );

      var settingsMap = settings.toMap();

      expect(settingsMap, isA<Map<String, dynamic>>());
      expect(settingsMap['enableEmailNotifications'], settings.enableEmailNotifications);
      expect(settingsMap['enablePushNotifications'], settings.enablePushNotifications);
    });

    // Teste para verificar a função fromMap
    test('fromMap should create a valid NotificationSettings object', () {
      var settingsMap = {
        'enableEmailNotifications': enableEmailNotifications,
        'enablePushNotifications': enablePushNotifications,
        'enableDiscordNotifications': enableDiscordNotifications,
      };

      var settings = NotificationSettings.fromMap(settingsMap);

      expect(settings, isA<NotificationSettings>());
      expect(settings.enableEmailNotifications, settingsMap['enableEmailNotifications']);
      expect(settings.enablePushNotifications, settingsMap['enablePushNotifications']);
    });

    // Teste para verificar as funções de igualdade e hashCode
    test('NotificationSettings comparison and hashCode should work correctly', () {
      var settings1 = const NotificationSettings(
        enableEmailNotifications: enableEmailNotifications,
        enablePushNotifications: enablePushNotifications,
        enableDiscordNotifications: enableDiscordNotifications,
      );

      var settings2 = const NotificationSettings(
        enableEmailNotifications: enableEmailNotifications,
        enablePushNotifications: enablePushNotifications,
        enableDiscordNotifications: enableDiscordNotifications,
      );

      expect(settings1, settings2);
      expect(settings1.hashCode, settings2.hashCode);
    });
    test('props should return the correct list of properties for NotificationSettings', () {
      const settings = NotificationSettings(
        enableEmailNotifications: true,
        enablePushNotifications: false,
        enableDiscordNotifications: true,
      );

      expect(settings.props, equals([
        true,
        false,
        true,
      ]));
    });
    test('NotificationSettings equality should consider enablePushNotifications', () {
      const settings1 = NotificationSettings(
        enableEmailNotifications: true,
        enablePushNotifications: false,
        enableDiscordNotifications: true,
      );

      const settings2 = NotificationSettings(
        enableEmailNotifications: true,
        enablePushNotifications: true, // Diferente
        enableDiscordNotifications: true,
      );

      expect(settings1 == settings2, isFalse);
    });
    test('NotificationSettings equality should consider enableDiscordNotifications', () {
      const settings1 = NotificationSettings(
        enableEmailNotifications: true,
        enablePushNotifications: true,
        enableDiscordNotifications: false,
      );

      const settings2 = NotificationSettings(
        enableEmailNotifications: true,
        enablePushNotifications: true,
        enableDiscordNotifications: true, // Diferente
      );

      expect(settings1 == settings2, isFalse);
    });


    test('NotificationSettings should return false when comparing different objects', () {
      const settings1 = NotificationSettings(
        enableEmailNotifications: true,
        enablePushNotifications: false,
        enableDiscordNotifications: true,
      );

      const settings2 = NotificationSettings(
        enableEmailNotifications: false,  // Diferente
        enablePushNotifications: true,   // Diferente
        enableDiscordNotifications: false,
      );

      expect(settings1 == settings2, isFalse);
    });
    test('NotificationSettings should return true when comparing identical objects', () {
      const settings1 = NotificationSettings(
        enableEmailNotifications: true,
        enablePushNotifications: false,
        enableDiscordNotifications: true,
      );

      const settings2 = NotificationSettings(
        enableEmailNotifications: true,
        enablePushNotifications: false,
        enableDiscordNotifications: true,
      );

      expect(settings1 == settings2, isTrue);
    });



  });
}
