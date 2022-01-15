import 'package:komiku_sdk/src/constants/komiku_url.dart';
import 'package:komiku_sdk/src/enums/manga_type.dart';
import 'package:komiku_sdk/src/models/popular_manga.dart';
import 'package:komiku_sdk/src/services/core_service.dart';
import 'package:universal_html/html.dart';

class PopularService extends CoreService {
  Future<List<PopularManga>> popular(MangaType? mangaType) async {
    String url = KomikuUrl.baseUrl;

    Document? document = await getBodyFromUrl(url);
    List<Map<String, String>> result = [];

    if (document != null) {
      List<Element> root =
          document.querySelectorAll('#Trending > .perapih > .ls123 > .ls23');

      for (Element elm in root) {
        String title = elm.querySelector('h4')!.text!.trim();
        String thumb =
            elm.querySelector('.ls23v > a > img')!.getAttribute('src')!;
        String type =
            elm.querySelector('.ls23v > a > div')!.getAttribute('class')!;
        String reader = elm.querySelector('.ls23t')!.firstChild!.text!;
        String release = elm.querySelector('.ls23t')!.lastChild!.text!;
        String detailEndpoint =
            elm.querySelector('.ls23v > a')!.getAttribute('href')!;
        String chapterEndpoint =
            elm.querySelector('.ls23j > a')!.getAttribute('href')!;

        result.add({
          'title': title,
          'thumb': thumb,
          'type': type,
          'reader': reader,
          'release': release,
          'detail_endpoint': detailEndpoint,
          'chapter_endpoint': chapterEndpoint,
        });
      }
    }

    return PopularManga.fromJson(result);
  }
}
