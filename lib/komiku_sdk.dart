library komiku_sdk;

import 'package:komiku_sdk/enums/manga_type.dart';

class Komiku {
  /// Get latest manga/manhwa/manhua.
  /// If mangaType variable not fill it.
  /// Its will be retrieve latest manga, manhwa and manhua.
  static void latest({MangaType mangaType: MangaType.Manga}) {
    print(mangaType);
  }
}
