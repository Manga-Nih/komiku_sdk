import 'package:komiku_sdk/src/enums/manga_type.dart';
import 'package:komiku_sdk/src/services/latest_service.dart';

class Komiku {
  final LatestService _service = LatestService();

  /// Get latest manga/manhwa/manhua.
  /// If mangaType variable not fill it.
  /// Its will be retrieve latest manga, manhwa and manhua.
  void latest({MangaType mangaType: MangaType.Manga}) {
    _service.latest();
  }
}
