import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;
import 'package:komiku_sdk/komiku_sdk.dart';
import 'package:komiku_sdk/models.dart';

void main() {
  late Komiku komiku;

  setUp(() => komiku = Komiku.instance);

  group('Komiku popular manga', () {
    expectResult(List<PopularManga> listPopular,
        {bool isMangaType = false}) async {
      for (var popular in listPopular) {
        expect(popular.title, isNotNull);
        expect(popular.thumb, isNotNull);
        expect(popular.type, isNotNull);
        expect(popular.reader, isNotNull);
        expect(popular.release, isNotNull);
        expect(popular.detailEndpoint, isNotNull);
        expect(popular.chapterEndpoint, isMangaType ? isNull : isNotNull);

        int statusCode = (await http.get(Uri.parse(popular.thumb))).statusCode;
        expect(statusCode, 200);
      }
    }

    test('Get popular', () async {
      List<PopularManga> popular = await komiku.popular();

      expect(popular.length, isNot(0));
      await expectResult(popular);
    });
  });
}
