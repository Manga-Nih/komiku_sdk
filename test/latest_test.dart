import 'package:http/http.dart' as http;
import 'package:komiku_sdk/enum.dart';
import 'package:komiku_sdk/komiku_sdk.dart';
import 'package:komiku_sdk/models.dart';
import 'package:test/test.dart';

void main() {
  late Komiku komiku;

  setUp(() => komiku = Komiku.instance);

  group('Komiku latest manga', () {
    expectResult(List<LatestManga> latests) async {
      for (var latest in latests) {
        expect(latest.title, isNotNull);
        expect(latest.thumb, isNotNull);
        expect(latest.type, isNotNull);
        expect(latest.release, isNotNull);
        expect(latest.detailEndpoint, isNotNull);
        expect(latest.chapterEndpoint, isNotNull);

        int statusCode = (await http.get(Uri.parse(latest.thumb))).statusCode;
        expect(statusCode, 200);
      }
    }

    test('Get latest', () async {
      List<LatestManga> latests = await komiku.latest();

      expect(latests.length, isNot(0));
      await expectResult(latests);
    }, timeout: const Timeout(Duration(minutes: 1)));

    test('Get latest manga', () async {
      List<LatestManga> latests =
          await komiku.latest(mangaType: MangaType.manga);

      expect(latests.length, isNot(0));
      await expectResult(latests);
    }, timeout: const Timeout(Duration(minutes: 1)));

    test('Get latest manhua', () async {
      List<LatestManga> latests =
          await komiku.latest(mangaType: MangaType.manhua);

      expect(latests.length, isNot(0));
      await expectResult(latests);
    }, timeout: const Timeout(Duration(minutes: 1)));

    test('Get latest manhwa', () async {
      List<LatestManga> latests =
          await komiku.latest(mangaType: MangaType.manhwa);

      expect(latests.length, isNot(0));
      await expectResult(latests);
    }, timeout: const Timeout(Duration(minutes: 1)));
  }, timeout: const Timeout(Duration(minutes: 1)));
}
