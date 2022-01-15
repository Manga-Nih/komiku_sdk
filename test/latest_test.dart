import 'package:flutter_test/flutter_test.dart';
import 'package:komiku_sdk/komiku_sdk.dart';
import 'package:komiku_sdk/src/enums/manga_type.dart';
import 'package:komiku_sdk/src/models/latest_manga.dart';

void main() {
  late Komiku komiku;

  setUp(() => komiku = Komiku());

  group('Komiku latest manga', () {
    expectResult(List<LatestManga> latests) {
      for (var latest in latests) {
        expect(latest.title, isNot(''));
        expect(latest.thumb, isNot(''));
        expect(latest.type, isNot(null));
        expect(latest.release, isNot(''));
        expect(latest.detailEndpoint, isNot(''));
        expect(latest.chapterEndpoint, isNot(''));
      }
    }

    test('Get latest', () async {
      List<LatestManga> latests = await komiku.latest();

      expectResult(latests);
    });

    test('Get latest manga', () async {
      List<LatestManga> latests =
          await komiku.latest(mangaType: MangaType.manga);

      expectResult(latests);
    });

    test('Get latest manhua', () async {
      List<LatestManga> latests =
          await komiku.latest(mangaType: MangaType.manhua);

      expectResult(latests);
    });

    test('Get latest manhwa', () async {
      List<LatestManga> latests =
          await komiku.latest(mangaType: MangaType.manhwa);

      expectResult(latests);
    });
  });
}
