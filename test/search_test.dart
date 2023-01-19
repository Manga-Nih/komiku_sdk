import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;
import 'package:komiku_sdk/komiku_sdk.dart';
import 'package:komiku_sdk/models.dart';

void main() {
  late Komiku komiku;

  setUp(() => komiku = Komiku.instance);

  group('Komiku search manga', () {
    expectResult(List<Manga> listSearch) async {
      for (var search in listSearch) {
        expect(search.title, isNotNull);
        expect(search.thumb, isNotNull);
        expect(search.type, isNotNull);
        expect(search.detailEndpoint, isNotNull);
        expect(search.description, isNotNull);
        expect(search.firstChapter, isNotNull);
        expect(search.firstChapterEndpoint, isNotNull);
        expect(search.lastChapter, isNotNull);
        expect(search.lastChapterEndpoint, isNotNull);

        int statusCode = (await http.get(Uri.parse(search.thumb))).statusCode;
        expect(statusCode, 200);
      }
    }

    test('Get search manga with keyword "one piece"', () async {
      List<Manga> search = await komiku.search(keyword: 'one piece');

      expect(search.length, isNot(0));
      await expectResult(search);
    });

    test('Get search manga with keyword "boku"', () async {
      List<Manga> search = await komiku.search(keyword: 'boku');

      expect(search.length, isNot(0));
      await expectResult(search);
    });

    test('Get search manga with keyword "bokuxxx"', () async {
      List<Manga> search = await komiku.search(keyword: 'bokuxxx');

      expect(search.length, 0);
    });
  });
}
