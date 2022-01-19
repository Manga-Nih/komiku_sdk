import 'package:flutter_test/flutter_test.dart';
import 'package:komiku_sdk/enum.dart';
import 'package:komiku_sdk/komiku_sdk.dart';
import 'package:komiku_sdk/models.dart';

void main() {
  late Komiku komiku;

  setUp(() => komiku = Komiku());

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

  group('Komiku all manga, manhua and manhwa', () {
    test('Get all manga', () async {
      List<Manga> listManga = await komiku.allManga();

      expect(listManga.length, isNot(0));
      expectResult(listManga);
    });

    test('Get all manga in page 7', () async {
      List<Manga> listManga = await komiku.allManga(page: 7);

      expect(listManga.length, isNot(0));
      expectResult(listManga);
    });

    test('Get all manhua', () async {
      List<Manga> listManhua = await komiku.allManhua();

      expect(listManhua.length, isNot(0));
      expectResult(listManhua);
    });

    test('Get all manhua in page 7', () async {
      List<Manga> listManhua = await komiku.allManhua(page: 7);

      expect(listManhua.length, isNot(0));
      expectResult(listManhua);
    });
    test('Get all manhwa', () async {
      List<Manga> listManhwa = await komiku.allManhwa();

      expect(listManhwa.length, isNot(0));
      expectResult(listManhwa);
    });

    test('Get all manhwa in page 7', () async {
      List<Manga> listManhwa = await komiku.allManhwa(page: 7);

      expect(listManhwa.length, isNot(0));
      expectResult(listManhwa);
    });
  });

  group('Komiku all manga by genre', () {
    test('Get all manga by genre "romance"', () async {
      List<Manga> listManga =
          await komiku.allMangaByGenre(genreEndpoint: 'romance');

      expect(listManga.length, isNot(0));
      expectResult(listManga);
    });

    test('Get all manga by genre "romance" in page 5', () async {
      List<Manga> listManga =
          await komiku.allMangaByGenre(genreEndpoint: 'romance');

      expect(listManga.length, isNot(0));
      expectResult(listManga);
    });

    test('Get all manga by genre "comedy"', () async {
      List<Manga> listManga =
          await komiku.allMangaByGenre(genreEndpoint: 'comedy');

      expect(listManga.length, isNot(0));
      expectResult(listManga);
    });

    test('Get all manga by genre "comedy" in page 5', () async {
      List<Manga> listManga =
          await komiku.allMangaByGenre(genreEndpoint: 'comedy');

      expect(listManga.length, isNot(0));
      expectResult(listManga);
    });

    test('Get all manga by genre "romancexxxxx"', () async {
      List<Manga> listManga =
          await komiku.allMangaByGenre(genreEndpoint: 'romancexxxxx');

      expect(listManga.length, 0);
    });
  });
}
