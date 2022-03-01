import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;
import 'package:komiku_sdk/komiku_sdk.dart';
import 'package:komiku_sdk/models.dart';

void main() {
  late Komiku komiku;

  setUp(() => komiku = Komiku());

  group('Komiku detail manga', () {
    test('Get detail manga - Martial Peak', () async {
      MangaDetail detail = await komiku.detail(detailEndpoint: 'martial-peak');

      expect(detail.title, isNotNull);
      expect(detail.titleId, isNotNull);
      expect(detail.thumb, isNotNull);
      expect(detail.type, isNotNull);
      expect(detail.typeName, isNotNull);
      expect(detail.writer, isNotNull);
      expect(detail.status, isNotNull);
      expect(detail.reader, isNotNull);
      expect(detail.readDirection, isNotNull);
      expect(detail.genre, isNotNull);
      expect(detail.summaries, isNotEmpty);
      expect(detail.synopsis, isNotNull);
      expect(detail.chapters, isNotEmpty);

      expect((await http.get(Uri.parse(detail.thumb))).statusCode, 200);
    });
  });
}
