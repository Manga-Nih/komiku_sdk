import 'package:flutter_test/flutter_test.dart';
import 'package:komiku_sdk/enum.dart';
import 'package:komiku_sdk/komiku_sdk.dart';
import 'package:komiku_sdk/models.dart';

void main() {
  late Komiku komiku;

  setUp(() => komiku = Komiku());

  group('Komiku popular manga', () {
    expectResult(List<PopularManga> listPopular) {
      for (var popular in listPopular) {
        expect(popular.title, isNot(''));
        expect(popular.thumb, isNot(''));
        expect(popular.type, isNot(MangaType.none));
        expect(popular.reader, isNot(''));
        expect(popular.release, isNot(''));
        expect(popular.detailEndpoint, isNot(''));
        expect(popular.chapterEndpoint, isNot(''));
      }
    }

    test('Get popular', () async {
      List<PopularManga> popular = await komiku.popular();

      expect(popular.length, isNot(0));
      expectResult(popular);
    });

    test('Get popular manga', () async {
      List<PopularManga> popular =
          await komiku.popular(mangaType: MangaType.manga);

      expect(popular.length, isNot(0));
      expectResult(popular);
    });

    test('Get popular manhua', () async {
      List<PopularManga> popular =
          await komiku.popular(mangaType: MangaType.manhua);

      expect(popular.length, isNot(0));
      expectResult(popular);
    });

    test('Get popular manhwa', () async {
      List<PopularManga> popular =
          await komiku.popular(mangaType: MangaType.manhwa);

      expect(popular.length, isNot(0));
      expectResult(popular);
    });
  });
}
