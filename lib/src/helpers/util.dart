import 'package:komiku_sdk/src/enums/manga_type.dart';

class Util {
  static MangaType getType(String type) {
    MangaType mangaType = MangaType.manga;

    if (type.toLowerCase() == 'manhua') {
      mangaType = MangaType.manhua;
    } else if (type.toLowerCase() == 'manhwa') {
      mangaType = MangaType.manhwa;
    }

    return mangaType;
  }

  static String toSlug(String str) =>
      str.toLowerCase().replaceAll(RegExp(r' '), '-');
}
