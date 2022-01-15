import 'package:flutter_test/flutter_test.dart';
import 'package:komiku_sdk/komiku_sdk.dart';
import 'package:komiku_sdk/src/enums/manga_type.dart';
import 'package:komiku_sdk/src/models/popular_manga.dart';
import 'package:komiku_sdk/src/models/search_manga.dart';

void main() {
  late Komiku komiku;

  setUp(() => komiku = Komiku());

  group('Komiku search manga', () {
    expectResult(List<SearchManga> listSearch) {
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
      List<SearchManga> search = await komiku.search(keyword: 'one piece');

      expectResult(search);
    });

    test('Get search manga with keyword "boku"', () async {
      List<SearchManga> search = await komiku.search(keyword: 'boku');

      expectResult(search);
    });
  });
}
