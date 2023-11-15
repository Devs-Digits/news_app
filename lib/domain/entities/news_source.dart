// Classe Fonte de Notícia
import 'package:equatable/equatable.dart';

class NewsSource extends Equatable {
  final String id;
  final String name;
  final double credibilityScore;
  final String politicalOrientation;

  @override
  List<Object> get props => [id, name, credibilityScore, politicalOrientation];

//<editor-fold desc="Data Methods">
  const NewsSource({
    required this.id,
    required this.name,
    required this.credibilityScore,
    required this.politicalOrientation,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) || (other is NewsSource && runtimeType == other.runtimeType && id == other.id && name == other.name && credibilityScore == other.credibilityScore && politicalOrientation == other.politicalOrientation);

  @override
  int get hashCode =>
      id.hashCode ^
      name.hashCode ^
      credibilityScore.hashCode ^
      politicalOrientation.hashCode;

  @override
  String toString() {
    return 'NewsSource{ id: $id, name: $name, credibilityScore: $credibilityScore, politicalOrientation: $politicalOrientation,}';
  }

  NewsSource copyWith({
    String? id,
    String? name,
    double? credibilityScore,
    String? politicalOrientation,
  }) {
    return NewsSource(
      id: id ?? this.id,
      name: name ?? this.name,
      credibilityScore: credibilityScore ?? this.credibilityScore,
      politicalOrientation: politicalOrientation ?? this.politicalOrientation,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'credibilityScore': credibilityScore,
      'politicalOrientation': politicalOrientation,
    };
  }

  factory NewsSource.fromMap(Map<String, dynamic> map) {
    return NewsSource(
      id: map['id'] as String,
      name: map['name'] as String,
      credibilityScore: map['credibilityScore'] as double,
      politicalOrientation: map['politicalOrientation'] as String,
    );
  }

//</editor-fold>
}
