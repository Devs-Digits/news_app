import 'package:test/test.dart';
import 'package:news_app/domain/entities/sentiment_analysis.dart';

void main() {
  group('SentimentAnalysis Class Tests', () {
    // Dados de exemplo para testes
    const newsArticleId = 'article123';
    const positivityScore = 0.8;
    const negativityScore = 0.2;
    const overallSentiment = 'Positive';

    group('SentimentAnalysis toString Test', () {
      test('Should return a valid string representation', () {
        const analysis = SentimentAnalysis(
          newsArticleId: 'article123',
          positivityScore: 0.8,
          negativityScore: 0.2,
          overallSentiment: 'Positive',
        );

        expect(analysis.toString(),
            'SentimentAnalysis{ newsArticleId: article123, positivityScore: 0.8, negativityScore: 0.2, overallSentiment: Positive,}');
      });
    });

    // Teste para verificar a criação correta do objeto
    test('Should create a valid SentimentAnalysis object', () {
      var sentimentAnalysis = const SentimentAnalysis(
        newsArticleId: newsArticleId,
        positivityScore: positivityScore,
        negativityScore: negativityScore,
        overallSentiment: overallSentiment,
      );

      expect(sentimentAnalysis.newsArticleId, newsArticleId);
      expect(sentimentAnalysis.positivityScore, positivityScore);
      expect(sentimentAnalysis.negativityScore, negativityScore);
      expect(sentimentAnalysis.overallSentiment, overallSentiment);
    });

    // Teste para verificar a função copyWith
    test('copyWith should update the sentimentAnalysis correctly', () {
      var sentimentAnalysis = const SentimentAnalysis(
        newsArticleId: newsArticleId,
        positivityScore: positivityScore,
        negativityScore: negativityScore,
        overallSentiment: overallSentiment,
      );

      var updatedSentiment =
          sentimentAnalysis.copyWith(overallSentiment: 'Neutral');
      var updatedSentiment2 =
          sentimentAnalysis.copyWith(newsArticleId: 'Neutral');

      expect(updatedSentiment.overallSentiment, 'Neutral');
      expect(
          updatedSentiment.positivityScore,
          sentimentAnalysis
              .positivityScore); // PositivityScore deve permanecer o mesmo
      expect(
          updatedSentiment2.overallSentiment,
          sentimentAnalysis
              .overallSentiment); // PositivityScore deve permanecer o mesmo
    });

    // Teste para verificar a função toMap
    test('toMap should return a valid map', () {
      var sentimentAnalysis = const SentimentAnalysis(
        newsArticleId: newsArticleId,
        positivityScore: positivityScore,
        negativityScore: negativityScore,
        overallSentiment: overallSentiment,
      );

      var sentimentMap = sentimentAnalysis.toMap();

      expect(sentimentMap, isA<Map<String, dynamic>>());
      expect(sentimentMap['newsArticleId'], sentimentAnalysis.newsArticleId);
      expect(
          sentimentMap['positivityScore'], sentimentAnalysis.positivityScore);
    });

    // Teste para verificar a função fromMap
    test('fromMap should create a valid SentimentAnalysis object', () {
      var sentimentMap = {
        'newsArticleId': newsArticleId,
        'positivityScore': positivityScore,
        'negativityScore': negativityScore,
        'overallSentiment': overallSentiment,
      };

      var sentimentAnalysis = SentimentAnalysis.fromMap(sentimentMap);

      expect(sentimentAnalysis, isA<SentimentAnalysis>());
      expect(sentimentAnalysis.newsArticleId, sentimentMap['newsArticleId']);
      expect(
          sentimentAnalysis.positivityScore, sentimentMap['positivityScore']);
    });

    // Teste para verificar as funções de igualdade e hashCode
    test('SentimentAnalysis comparison and hashCode should work correctly', () {
      var sentiment1 = const SentimentAnalysis(
        newsArticleId: newsArticleId,
        positivityScore: positivityScore,
        negativityScore: negativityScore,
        overallSentiment: overallSentiment,
      );

      var sentiment2 = const SentimentAnalysis(
        newsArticleId: newsArticleId,
        positivityScore: positivityScore,
        negativityScore: negativityScore,
        overallSentiment: overallSentiment,
      );

      expect(sentiment1, sentiment2);
      expect(sentiment1.hashCode, sentiment2.hashCode);
    });
    test('SentimentAnalysis equality', () {
      var sentiment1 = const SentimentAnalysis(
        newsArticleId: newsArticleId,
        positivityScore: positivityScore,
        negativityScore: negativityScore,
        overallSentiment: overallSentiment,
      );

      var sentiment2 = const SentimentAnalysis(
        newsArticleId: '${newsArticleId}1',
        positivityScore: positivityScore + 1,
        negativityScore: negativityScore + 1,
        overallSentiment: '${overallSentiment}1',
      );

      expect(sentiment1 == sentiment2, isFalse);
    });
    test('SentimentAnalysis equality', () {
      var sentiment1 = const SentimentAnalysis(
        newsArticleId: newsArticleId,
        positivityScore: positivityScore,
        negativityScore: negativityScore,
        overallSentiment: overallSentiment,
      );
      var sentiment2 = const SentimentAnalysis(
        newsArticleId: newsArticleId,
        positivityScore: positivityScore + 1,
        negativityScore: negativityScore,
        overallSentiment: '${overallSentiment}1',
      );
      var sentiment3 = const SentimentAnalysis(
        newsArticleId: newsArticleId,
        positivityScore: positivityScore,
        negativityScore: negativityScore + 1,
        overallSentiment: '${overallSentiment}1',
      );
      var sentiment4 = const SentimentAnalysis(
        newsArticleId: newsArticleId,
        positivityScore: positivityScore,
        negativityScore: negativityScore,
        overallSentiment: '${overallSentiment}1',
      );

      expect(sentiment1 == sentiment2, isFalse);
      expect(sentiment1 == sentiment3, isFalse);
      expect(sentiment1 == sentiment4, isFalse);
    });
  });
}
