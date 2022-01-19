import 'package:flutter_test/flutter_test.dart';
import 'package:komiku_sdk/enum.dart';
import 'package:komiku_sdk/komiku_sdk.dart';
import 'package:komiku_sdk/models.dart';

void main() {
  late Komiku komiku;

  setUp(() => komiku = Komiku());

  group('Komiku latest manga', () {
    expectResult(List<LatestManga> latests) {
      for (var latest in latests) {
        expect(latest.title, isNotNull);
        expect(latest.thumb, isNotNull);
        expect(latest.type, isNotNull);
        expect(latest.release, isNotNull);
        expect(latest.detailEndpoint, isNotNull);
        expect(latest.chapterEndpoint, isNotNull);
      }
    }

    test('Get latest', () async {
      List<LatestManga> latests = await komiku.latest();

      expect(latests.length, isNot(0));
      expectResult(latests);
    });

    test('Get latest manga', () async {
      List<LatestManga> latests =
          await komiku.latest(mangaType: MangaType.manga);

      expect(latests.length, isNot(0));
      expectResult(latests);
    });

    test('Get latest manhua', () async {
      List<LatestManga> latests =
          await komiku.latest(mangaType: MangaType.manhua);

      expect(latests.length, isNot(0));
      expectResult(latests);
    });

    test('Get latest manhwa', () async {
      List<LatestManga> latests =
          await komiku.latest(mangaType: MangaType.manhwa);

      expect(latests.length, isNot(0));
      expectResult(latests);
    });
  });
}
