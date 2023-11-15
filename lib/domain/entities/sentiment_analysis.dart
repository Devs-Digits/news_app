// Classe Análise de Sentimento
class SentimentAnalysis {
  final String newsArticleId; // ID do artigo de notícia
  final double positivityScore; // Pontuação de positividade
  final double negativityScore; // Pontuação de negatividade
  final String overallSentiment;

//<editor-fold desc="Data Methods">

  const SentimentAnalysis({
    required this.newsArticleId,
    required this.positivityScore,
    required this.negativityScore,
    required this.overallSentiment,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
          (other is SentimentAnalysis &&
              runtimeType == other.runtimeType &&
              newsArticleId == other.newsArticleId &&
              positivityScore == other.positivityScore &&
              negativityScore == other.negativityScore &&
              overallSentiment == other.overallSentiment
          );


  @override
  int get hashCode =>
      newsArticleId.hashCode ^
      positivityScore.hashCode ^
      negativityScore.hashCode ^
      overallSentiment.hashCode;


  @override
  String toString() {
    return 'SentimentAnalysis{ newsArticleId: $newsArticleId, positivityScore: $positivityScore, negativityScore: $negativityScore, overallSentiment: $overallSentiment,}';
  }


  SentimentAnalysis copyWith({
    String? newsArticleId,
    double? positivityScore,
    double? negativityScore,
    String? overallSentiment,
  }) {
    return SentimentAnalysis(
      newsArticleId: newsArticleId ?? this.newsArticleId,
      positivityScore: positivityScore ?? this.positivityScore,
      negativityScore: negativityScore ?? this.negativityScore,
      overallSentiment: overallSentiment ?? this.overallSentiment,
    );
  }


  Map<String, dynamic> toMap() {
    return {
      'newsArticleId': newsArticleId,
      'positivityScore': positivityScore,
      'negativityScore': negativityScore,
      'overallSentiment': overallSentiment,
    };
  }

  factory SentimentAnalysis.fromMap(Map<String, dynamic> map) {
    return SentimentAnalysis(
      newsArticleId: map['newsArticleId'] as String,
      positivityScore: map['positivityScore'] as double,
      negativityScore: map['negativityScore'] as double,
      overallSentiment: map['overallSentiment'] as String,
    );
  }


  //</editor-fold>


}
