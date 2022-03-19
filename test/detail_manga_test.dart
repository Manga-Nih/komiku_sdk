import 'package:http/http.dart' as http;
import 'package:komiku_sdk/komiku_sdk.dart';
import 'package:komiku_sdk/models.dart';
import 'package:test/test.dart';

void main() {
  late Komiku komiku;

  setUp(() => komiku = Komiku.instance);

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

      int statusCode = (await http.get(Uri.parse(detail.thumb))).statusCode;
      expect(statusCode, 200);
    });
  }, timeout: const Timeout(Duration(minutes: 1)));
}
