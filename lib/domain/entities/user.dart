import 'package:equatable/equatable.dart';
import 'package:news_app/domain/entities/notification_settings.dart';

class User extends Equatable{
  final String id;
  final String username;
  final String email;
  final List<String> preferences;
  final NotificationSettings notificationSettings;

//<editor-fold desc="Data Methods">

  const User({
    required this.id,
    required this.username,
    required this.email,
    required this.preferences,
    required this.notificationSettings,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
          (other is User &&
              runtimeType == other.runtimeType &&
              id == other.id &&
              username == other.username &&
              email == other.email &&
              preferences == other.preferences &&
              notificationSettings == other.notificationSettings
          );


  @override
  int get hashCode =>
      id.hashCode ^
      username.hashCode ^
      email.hashCode ^
      preferences.hashCode ^
      notificationSettings.hashCode;


  @override
  String toString() {
    return 'User{ id: $id, username: $username, email: $email, preferences: $preferences, notificationSettings: $notificationSettings,}';
  }


  User copyWith({
    String? id,
    String? username,
    String? email,
    List<String>? preferences,
    NotificationSettings? notificationSettings,
  }) {
    return User(
      id: id ?? this.id,
      username: username ?? this.username,
      email: email ?? this.email,
      preferences: preferences ?? this.preferences,
      notificationSettings: notificationSettings ?? this.notificationSettings,
    );
  }


  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'username': username,
      'email': email,
      'preferences': preferences,
      'notificationSettings': notificationSettings,
    };
  }

  factory User.fromMap(Map<String, dynamic> map) {
    return User(
      id: map['id'] as String,
      username: map['username'] as String,
      email: map['email'] as String,
      preferences: map['preferences'] as List<String>,
      notificationSettings: map['notificationSettings'] as NotificationSettings,
    );
  }

  @override
  // TODO: implement props
  List<Object?> get props => [id,
    username,
    email,
    preferences,
    notificationSettings];


  //</editor-fold>
}
