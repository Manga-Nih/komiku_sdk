import 'package:komiku_sdk/src/constants/komiku_url.dart';
import 'package:komiku_sdk/src/enums/manga_type.dart';
import 'package:komiku_sdk/src/models/latest_manga.dart';
import 'package:komiku_sdk/src/services/core_service.dart';
import 'package:universal_html/html.dart';

class LatestService extends CoreService {
  Future<List<LatestManga>> latest(MangaType? mangaType) async {
    late String url;

    switch (mangaType) {
      case MangaType.manga:
        url = KomikuUrl.mangaHomeUrl;
        break;

      case MangaType.manhua:
        url = KomikuUrl.manhuaHomeUrl;
        break;

      case MangaType.manhwa:
        url = KomikuUrl.manhwaHomeUrl;
        break;

      default:
        url = KomikuUrl.baseUrl;
    }

    Document? document = await getBodyFromUrl(url);
    List<Map<String, String>> result = [];

    if (document != null) {
      List<Element> root = document.querySelectorAll('#Terbaru > .ls4w > .ls4');
      for (Element elm in root) {
        String title = elm.querySelector('h4')!.text!.trim();
        String thumb =
            elm.querySelector('.ls4v > a > img')!.getAttribute('data-src')!;

        List<String> typeRelease =
            elm.querySelector('.ls4j > .ls4s')!.text!.split('•');
        String type = typeRelease[0].trim().split(' ')[0];
        String release = typeRelease[1].trim();

        String detailEndpoint =
            elm.querySelector('.ls4v > a')!.getAttribute('href')!;
        String chapterEndpoint =
            elm.querySelector('.ls4j > a')!.getAttribute('href')!;

        result.add({
          'title': title,
          'thumb': thumb,
          'type': type,
          'release': release,
          'detail_endpoint': detailEndpoint,
          'chapter_endpoint': chapterEndpoint,
        });
      }
    }

    return LatestManga.fromJson(result);
  }
}
