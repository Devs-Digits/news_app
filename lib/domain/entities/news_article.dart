
// Classe Notícia
import 'package:equatable/equatable.dart';

class NewsArticle extends Equatable{
  final String id;
  final String title;
  final String content;
  final String sourceId;
  final DateTime publicationDate;
  final String politicalAlignment;

//<editor-fold desc="Data Methods">

  const NewsArticle({
    required this.id,
    required this.title,
    required this.content,
    required this.sourceId,
    required this.publicationDate,
    required this.politicalAlignment,
  });


  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
          (other is NewsArticle &&
              runtimeType == other.runtimeType &&
              id == other.id &&
              title == other.title &&
              content == other.content &&
              sourceId == other.sourceId &&
              publicationDate == other.publicationDate &&
              politicalAlignment == other.politicalAlignment
          );


  @override
  int get hashCode =>
      id.hashCode ^
      title.hashCode ^
      content.hashCode ^
      sourceId.hashCode ^
      publicationDate.hashCode ^
      politicalAlignment.hashCode;


  @override
  String toString() {
    return 'NewsArticle{ id: $id, title: $title, content: $content, sourceId: $sourceId, publicationDate: $publicationDate, politicalAlignment: $politicalAlignment,}';
  }


  NewsArticle copyWith({
    String? id,
    String? title,
    String? content,
    String? sourceId,
    DateTime? publicationDate,
    String? politicalAlignment,
  }) {
    return NewsArticle(
      id: id ?? this.id,
      title: title ?? this.title,
      content: content ?? this.content,
      sourceId: sourceId ?? this.sourceId,
      publicationDate: publicationDate ?? this.publicationDate,
      politicalAlignment: politicalAlignment ?? this.politicalAlignment,
    );
  }


  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'content': content,
      'sourceId': sourceId,
      'publicationDate': publicationDate,
      'politicalAlignment': politicalAlignment,
    };
  }

  factory NewsArticle.fromMap(Map<String, dynamic> map) {
    return NewsArticle(
      id: map['id'] as String,
      title: map['title'] as String,
      content: map['content'] as String,
      sourceId: map['sourceId'] as String,
      publicationDate: map['publicationDate'] as DateTime,
      politicalAlignment: map['politicalAlignment'] as String,
    );
  }

  @override
  List<Object?> get props => [
    id,
    title,
    content,
    sourceId,
    publicationDate,
    politicalAlignment,
  ];


  //</editor-fold>
}
