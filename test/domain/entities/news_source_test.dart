import 'package:test/test.dart';
import 'package:news_app/domain/entities/news_source.dart';

void main() {
  group('NewsSource Class Tests', () {
    // Dados de exemplo para testes
    const id = 'source123';
    const name = 'Test News Source';
    const credibilityScore = 4.5;
    const politicalOrientation = 'Neutral';

    group('NewsSource toString Test', () {
      test('Should return a valid string representation', () {
        const source = NewsSource(
          id: 'source123',
          name: 'Test Source',
          credibilityScore: 4.5,
          politicalOrientation: 'Neutral',
        );

        const expectedString = 'NewsSource{ id: source123, name: Test Source, credibilityScore: 4.5, politicalOrientation: Neutral,}';
        expect(source.toString(), expectedString);
      });
    });

    // Teste para verificar a criação correta do objeto
    test('Should create a valid NewsSource object', () {
      var newsSource = const NewsSource(
        id: id,
        name: name,
        credibilityScore: credibilityScore,
        politicalOrientation: politicalOrientation,
      );

      expect(newsSource.id, id);
      expect(newsSource.name, name);
      expect(newsSource.credibilityScore, credibilityScore);
      expect(newsSource.politicalOrientation, politicalOrientation);
    });

    // Teste para verificar a função copyWith
    test('copyWith should update the newsSource correctly', () {
      var newsSource = const NewsSource(
        id: id,
        name: name,
        credibilityScore: credibilityScore,
        politicalOrientation: politicalOrientation,
      );

      var updatedSource = newsSource.copyWith(name: 'Updated Test Source');

      expect(updatedSource.name, 'Updated Test Source');
      expect(updatedSource.credibilityScore, newsSource.credibilityScore); // credibilityScore deve permanecer o mesmo
    });

    // Teste para verificar a função toMap
    test('toMap should return a valid map', () {
      var newsSource = const NewsSource(
        id: id,
        name: name,
        credibilityScore: credibilityScore,
        politicalOrientation: politicalOrientation,
      );

      var sourceMap = newsSource.toMap();

      expect(sourceMap, isA<Map<String, dynamic>>());
      expect(sourceMap['id'], newsSource.id);
      expect(sourceMap['name'], newsSource.name);
    });

    // Teste para verificar a função fromMap
    test('fromMap should create a valid newsSource object', () {
      var sourceMap = {
        'id': id,
        'name': name,
        'credibilityScore': credibilityScore,
        'politicalOrientation': politicalOrientation,
      };

      var newsSource = NewsSource.fromMap(sourceMap);

      expect(newsSource, isA<NewsSource>());
      expect(newsSource.id, sourceMap['id']);
      expect(newsSource.name, sourceMap['name']);
    });

    // Teste para verificar as funções de igualdade e hashCode
    test('NewsSource comparison and hashCode should work correctly', () {
      var source1 = const NewsSource(
        id: id,
        name: name,
        credibilityScore: credibilityScore,
        politicalOrientation: politicalOrientation,
      );

      var source2 = const NewsSource(
        id: id,
        name: name,
        credibilityScore: credibilityScore,
        politicalOrientation: politicalOrientation,
      );

      expect(source1, source2);
      expect(source1.hashCode, source2.hashCode);
    });
    test('NewsSource should support value equality', () {
      var source1 = const NewsSource(
        id: 'source123',
        name: 'Test Source',
        credibilityScore: 4.5,
        politicalOrientation: 'Neutral',
      );

      var source2 = const NewsSource(
        id: 'source123',
        name: 'Test Source',
        credibilityScore: 4.5,
        politicalOrientation: 'Neutral',
      );

      expect(source1, equals(source2));
    });
    test('NewsSource should return false when comparing different objects', () {
      var source1 = const NewsSource(
        id: 'source123',
        name: 'Test Source',
        credibilityScore: 4.5,
        politicalOrientation: 'Neutral',
      );

      var source2 = const NewsSource(
        id: 'source124',
        name: 'Another Source',
        credibilityScore: 3.5,
        politicalOrientation: 'Biased',
      );

      expect(source1 == source2, isFalse);
    });


    test('props should return the correct list of properties', () {
      var source = const NewsSource(
        id: 'source123',
        name: 'Test Source',
        credibilityScore: 4.5,
        politicalOrientation: 'Neutral',
      );

      expect(source.props, ['source123', 'Test Source', 4.5, 'Neutral']);
    });
    test('copyWith should update properties correctly', () {
      var original = const NewsSource(
        id: 'source123',
        name: 'Test Source',
        credibilityScore: 4.5,
        politicalOrientation: 'Neutral',
      );

      var modified = original.copyWith(id: 'Updated Source');

      expect(modified.id, 'Updated Source');
      expect(modified.credibilityScore, original.credibilityScore);
      expect(modified.politicalOrientation, original.politicalOrientation);
    });


  });
}
