import 'package:flutter_test/flutter_test.dart';
import 'package:komiku_sdk/komiku_sdk.dart';
import 'package:komiku_sdk/src/enums/manga_type.dart';
import 'package:komiku_sdk/src/models/popular_manga.dart';
import 'package:komiku_sdk/src/models/manga.dart';

void main() {
  late Komiku komiku;

  setUp(() => komiku = Komiku());

  group('Komiku all manga, manhua and manhwa', () {
    expectResult(List<Manga> listManga) {
      for (var manga in listManga) {
        expect(manga.title, isNot(''));
        expect(manga.thumb, isNot(''));
        expect(manga.type, isNot(MangaType.none));
        expect(manga.detailEndpoint, isNot(''));
        expect(manga.description, isNot(''));
        expect(manga.firstChapter, isNot(''));
        expect(manga.firstChapterEndpoint, isNot(''));
        expect(manga.lastChapter, isNot(''));
        expect(manga.lastChapterEndpoint, isNot(''));
      }
    }

    test('Get all manga', () async {
      List<Manga> listManga = await komiku.allManga();

      expectResult(listManga);
    });

    test('Get all manga in page 7', () async {
      List<Manga> listManga = await komiku.allManga(page: 7);

      expectResult(listManga);
    });

    test('Get all manhua', () async {
      List<Manga> listManhua = await komiku.allManhua();

      expectResult(listManhua);
    });

    test('Get all manhua in page 7', () async {
      List<Manga> listManhua = await komiku.allManhua(page: 7);

      expectResult(listManhua);
    });
    test('Get all manhwa', () async {
      List<Manga> listManhwa = await komiku.allManhwa();

      expectResult(listManhwa);
    });

    test('Get all manhwa in page 7', () async {
      List<Manga> listManhwa = await komiku.allManhwa(page: 7);

      expectResult(listManhwa);
    });
  });
}
