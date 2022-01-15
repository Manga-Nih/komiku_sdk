import 'package:flutter_test/flutter_test.dart';
import 'package:komiku_sdk/komiku_sdk.dart';
import 'package:komiku_sdk/src/models/latest_manga.dart';

void main() {
  late Komiku komiku;

  setUp(() => komiku = Komiku());

  test('Get latest', () async {
    List<LatestManga> latests = await komiku.latest();

    for (var latest in latests) {
      expect(latest.title, isNot(''));
      expect(latest.thumb, isNot(''));
      expect(latest.type, isNot(''));
      expect(latest.release, isNot(''));
      expect(latest.detailEndpoint, isNot(''));
      expect(latest.chapterEndpoint, isNot(''));
    }
  });
}
