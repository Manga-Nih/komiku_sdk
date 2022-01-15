import 'package:flutter_test/flutter_test.dart';
import 'package:komiku_sdk/enums/manga_type.dart';
import 'package:komiku_sdk/komiku_sdk.dart';

void main() {
  test('test print', () {
    Komiku.latest(mangaType: MangaType.Manhua);
  });
}
