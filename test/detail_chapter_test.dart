import 'package:test/test.dart';
import 'package:komiku_sdk/komiku_sdk.dart';
import 'package:komiku_sdk/models.dart';
import 'package:http/http.dart' as http;

void main() {
  late Komiku komiku;

  setUp(() => komiku = Komiku.instance);

  group('Komiku detail chapter', () {
    test('Get detail chapter - Martial Peak Chapter 1870', () async {
      ChapterDetail detail =
          await komiku.chapter(chapterEndpoint: 'martial-peak-chapter-1870');

      expect(detail.title, isNotNull);
      expect(detail.chapter, isNotNull);
      expect(detail.prevChapterEndpoint, isNotNull);
      expect(detail.nextChapterEndpoint, isNotNull);
      expect(detail.images, isNotEmpty);

      for (ChapterImage chapter in detail.images) {
        int statusCode = (await http.get(Uri.parse(chapter.image))).statusCode;
        expect(statusCode, 200);
      }
    }, timeout: const Timeout(Duration(minutes: 1)));
  }, timeout: const Timeout(Duration(minutes: 1)));
}
