import 'package:test/test.dart';
import 'package:news_app/domain/entities/news_article.dart';

void main() {
  group('NewsArticle Class Tests', () {
    // Dados de exemplo para testes
    const id = 'article123';
    const title = 'Test News';
    const content = 'This is a test news article';
    const sourceId = 'source123';
    final publicationDate = DateTime.now();
    const politicalAlignment = 'Neutral';

    group('NewsArticle toString Test', () {
      test('Should return a valid string representation', () {
        final article = NewsArticle(
          id: 'article123',
          title: 'Test Article',
          content: 'This is a test article content.',
          sourceId: 'source123',
          publicationDate: DateTime(2023, 1, 1),
          politicalAlignment: 'Neutral',
        );

        final expectedString = 'NewsArticle{ id: article123, title: Test Article, content: This is a test article content., sourceId: source123, publicationDate: ${article.publicationDate}, politicalAlignment: Neutral,}';
        expect(article.toString(), expectedString);
      });
    });

    // Teste para verificar a criação correta do objeto
    test('Should create a valid NewsArticle object', () {
      var newsArticle = NewsArticle(
        id: id,
        title: title,
        content: content,
        sourceId: sourceId,
        publicationDate: publicationDate,
        politicalAlignment: politicalAlignment,
      );

      expect(newsArticle.id, id);
      expect(newsArticle.title, title);
      expect(newsArticle.content, content);
      expect(newsArticle.sourceId, sourceId);
      expect(newsArticle.publicationDate, publicationDate);
      expect(newsArticle.politicalAlignment, politicalAlignment);
    });

    // Teste para verificar a função copyWith
    test('copyWith should update the newsArticle correctly', () {
      var newsArticle = NewsArticle(
        id: id,
        title: title,
        content: content,
        sourceId: sourceId,
        publicationDate: publicationDate,
        politicalAlignment: politicalAlignment,
      );

      var updatedArticle = newsArticle.copyWith(title: 'Updated Test News');
      var updatedArticle2 = newsArticle.copyWith(id: 'Updated Test News');

      expect(updatedArticle.title, 'Updated Test News');
      expect(updatedArticle.content, newsArticle.content); // Content deve permanecer o mesmo
      expect(updatedArticle2.title, newsArticle.title); // Content deve permanecer o mesmo
    });

    // Teste para verificar a função toMap
    test('toMap should return a valid map', () {
      var newsArticle = NewsArticle(
        id: id,
        title: title,
        content: content,
        sourceId: sourceId,
        publicationDate: publicationDate,
        politicalAlignment: politicalAlignment,
      );

      var articleMap = newsArticle.toMap();

      expect(articleMap, isA<Map<String, dynamic>>());
      expect(articleMap['id'], newsArticle.id);
      expect(articleMap['title'], newsArticle.title);
    });

    // Teste para verificar a função fromMap
    test('fromMap should create a valid newsArticle object', () {
      var articleMap = {
        'id': id,
        'title': title,
        'content': content,
        'sourceId': sourceId,
        'publicationDate': publicationDate,
        'politicalAlignment': politicalAlignment,
      };

      var newsArticle = NewsArticle.fromMap(articleMap);

      expect(newsArticle, isA<NewsArticle>());
      expect(newsArticle.id, articleMap['id']);
      expect(newsArticle.title, articleMap['title']);
    });

    // Teste para verificar as funções de igualdade e hashCode
    test('NewsArticle comparison and hashCode should work correctly', () {
      var article1 = NewsArticle(
        id: id,
        title: title,
        content: content,
        sourceId: sourceId,
        publicationDate: publicationDate,
        politicalAlignment: politicalAlignment,
      );

      var article2 = NewsArticle(
        id: id,
        title: title,
        content: content,
        sourceId: sourceId,
        publicationDate: publicationDate,
        politicalAlignment: politicalAlignment,
      );

      expect(article1, article2);
      expect(article1.hashCode, article2.hashCode);
    });
  });
  test('props should return the correct list of properties for NewsArticle', () {
    final publicationDate = DateTime.now();
    final newsArticle = NewsArticle(
      id: 'article123',
      title: 'Test Article',
      content: 'This is a test article content.',
      sourceId: 'source123',
      publicationDate: publicationDate,
      politicalAlignment: 'Neutral',
    );

    expect(newsArticle.props, equals([
      'article123',
      'Test Article',
      'This is a test article content.',
      'source123',
      publicationDate,
      'Neutral',
    ]));
  });

}
