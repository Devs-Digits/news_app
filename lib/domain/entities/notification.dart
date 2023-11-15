
// Classe Notificação
import 'package:equatable/equatable.dart';

class Notification extends Equatable {
  final String userId; // ID do usuário
  final String notificationContent; // Conteúdo da notificação
  final DateTime notificationTime; // Horário da notificação
  final bool sentToDiscord;

//<editor-fold desc="Data Methods">

 const Notification({
    required this.userId,
    required this.notificationContent,
    required this.notificationTime,
    required this.sentToDiscord,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
          (other is Notification &&
              runtimeType == other.runtimeType &&
              userId == other.userId &&
              notificationContent == other.notificationContent &&
              notificationTime == other.notificationTime &&
              sentToDiscord == other.sentToDiscord
          );


  @override
  int get hashCode =>
      userId.hashCode ^
      notificationContent.hashCode ^
      notificationTime.hashCode ^
      sentToDiscord.hashCode;


  @override
  String toString() {
    return 'Notification{ userId: $userId, notificationContent: $notificationContent, notificationTime: $notificationTime, sentToDiscord: $sentToDiscord,}';
  }


  Notification copyWith({
    String? userId,
    String? notificationContent,
    DateTime? notificationTime,
    bool? sentToDiscord,
  }) {
    return Notification(
      userId: userId ?? this.userId,
      notificationContent: notificationContent ?? this.notificationContent,
      notificationTime: notificationTime ?? this.notificationTime,
      sentToDiscord: sentToDiscord ?? this.sentToDiscord,
    );
  }


  Map<String, dynamic> toMap() {
    return {
      'userId': userId,
      'notificationContent': notificationContent,
      'notificationTime': notificationTime,
      'sentToDiscord': sentToDiscord,
    };
  }

  factory Notification.fromMap(Map<String, dynamic> map) {
    return Notification(
      userId: map['userId'] as String,
      notificationContent: map['notificationContent'] as String,
      notificationTime: map['notificationTime'] as DateTime,
      sentToDiscord: map['sentToDiscord'] as bool,
    );
  }

  @override
  List<Object?> get props => [userId,
    notificationContent,
    notificationTime,
    sentToDiscord];


  //</editor-fold>

}