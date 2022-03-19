import 'package:flutter_test/flutter_test.dart';
import 'package:komiku_sdk/komiku_sdk.dart';
import 'package:komiku_sdk/models.dart';

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
    });
  });
}
