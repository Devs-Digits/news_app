
// Classe Configurações de Notificação
import 'package:equatable/equatable.dart';

class NotificationSettings extends Equatable{
  final bool enableEmailNotifications;
  final bool enablePushNotifications;
  final bool enableDiscordNotifications;

//<editor-fold desc="Data Methods">
  const NotificationSettings({
    required this.enableEmailNotifications,
    required this.enablePushNotifications,
    required this.enableDiscordNotifications,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is NotificationSettings &&
          runtimeType == other.runtimeType &&
          enableEmailNotifications == other.enableEmailNotifications &&
          enablePushNotifications == other.enablePushNotifications &&
          enableDiscordNotifications == other.enableDiscordNotifications);

  @override
  int get hashCode =>
      enableEmailNotifications.hashCode ^
      enablePushNotifications.hashCode ^
      enableDiscordNotifications.hashCode;

  @override
  String toString() {
    return 'NotificationSettings{ enableEmailNotifications: $enableEmailNotifications, enablePushNotifications: $enablePushNotifications, enableDiscordNotifications: $enableDiscordNotifications,}';
  }

  NotificationSettings copyWith({
    bool? enableEmailNotifications,
    bool? enablePushNotifications,
    bool? enableDiscordNotifications,
  }) {
    return NotificationSettings(
      enableEmailNotifications:
          enableEmailNotifications ?? this.enableEmailNotifications,
      enablePushNotifications:
          enablePushNotifications ?? this.enablePushNotifications,
      enableDiscordNotifications:
          enableDiscordNotifications ?? this.enableDiscordNotifications,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'enableEmailNotifications': enableEmailNotifications,
      'enablePushNotifications': enablePushNotifications,
      'enableDiscordNotifications': enableDiscordNotifications,
    };
  }

  factory NotificationSettings.fromMap(Map<String, dynamic> map) {
    return NotificationSettings(
      enableEmailNotifications: map['enableEmailNotifications'] as bool,
      enablePushNotifications: map['enablePushNotifications'] as bool,
      enableDiscordNotifications: map['enableDiscordNotifications'] as bool,
    );
  }

  @override
  List<Object?> get props => [
    enableEmailNotifications,
    enablePushNotifications,
    enableDiscordNotifications
  ];

//</editor-fold>
}