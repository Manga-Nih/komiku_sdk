import 'package:flutter_test/flutter_test.dart';
import 'package:komiku_sdk/komiku_sdk.dart';
import 'package:komiku_sdk/src/enums/manga_type.dart';
import 'package:komiku_sdk/src/models/manga.dart';

void main() {
  late Komiku komiku;

  setUp(() => komiku = Komiku());

  group('Komiku search manga', () {
    expectResult(List<Manga> listSearch) {
      for (var search in listSearch) {
        expect(search.title, isNot(''));
        expect(search.thumb, isNot(''));
        expect(search.type, isNot(MangaType.none));
        expect(search.detailEndpoint, isNot(''));
        expect(search.description, isNot(''));
        expect(search.firstChapter, isNot(''));
        expect(search.firstChapterEndpoint, isNot(''));
        expect(search.lastChapter, isNot(''));
        expect(search.lastChapterEndpoint, isNot(''));
      }
    }

    test('Get search manga with keyword "one piece"', () async {
      List<Manga> search = await komiku.search(keyword: 'one piece');

      expect(search.length, isNot(0));
      expectResult(search);
    });

    test('Get search manga with keyword "boku"', () async {
      List<Manga> search = await komiku.search(keyword: 'boku');

      expect(search.length, isNot(0));
      expectResult(search);
    });

    test('Get search manga with keyword "bokuxxx"', () async {
      List<Manga> search = await komiku.search(keyword: 'bokuxxx');

      expect(search.length, 0);
    });
  });
}
