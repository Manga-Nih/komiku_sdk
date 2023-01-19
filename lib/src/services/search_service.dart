import 'package:komiku_sdk/src/constants/komiku_url.dart';
import 'package:komiku_sdk/src/mixins/manga_mixin.dart';
import 'package:komiku_sdk/src/models/manga.dart';
import 'package:komiku_sdk/src/services/core_service.dart';
import 'package:universal_html/html.dart';

class SearchService extends CoreService with MangaParser {
  Future<List<Manga>> search(String keyword) async {
    String url = '${KomikuUrl.baseUrl2}/cari/?post_type=manga&s=$keyword';

    Document? document = await getBodyFromUrl(url);
    List<Map<String, String?>> result = [];

    if (document != null) {
      result.addAll(mangaDomToMap(document));
    }

    return Manga.fromJson(result);
  }
}
