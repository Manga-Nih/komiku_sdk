import 'package:komiku_sdk/src/constants/komiku_url.dart';
import 'package:komiku_sdk/src/enums/manga_type.dart';
import 'package:komiku_sdk/src/mixins/manga_mixin.dart';
import 'package:komiku_sdk/src/models/manga.dart';
import 'package:komiku_sdk/src/services/core_service.dart';
import 'package:universal_html/html.dart';

class MangaService extends CoreService with MangaParser {
  Future<List<Manga>> allManga(int? page, MangaType mangaType) async {
    String pageNumber = (page ?? 1).toString();
    String url = pageNumber == '1'
        ? '${KomikuUrl.baseUrl2}/pustaka/?orderby=modified&genre&genre2&status&category_name=${mangaType.name}'
        : '${KomikuUrl.baseUrl2}/pustaka/page/${pageNumber}/?orderby=modified&genre&genre2&status&category_name=${mangaType.name}';

    Document? document = await getBodyFromUrl(url);
    List<Map<String, String?>> result = [];

    if (document != null) {
      result.addAll(mangaDomToMap(document));
    }

    return Manga.fromJson(result);
  }
}
