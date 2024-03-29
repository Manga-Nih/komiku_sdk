import 'package:komiku_sdk/src/constants/komiku_url.dart';
import 'package:komiku_sdk/src/models/latest_manga.dart';
import 'package:komiku_sdk/src/services/core_service.dart';
import 'package:universal_html/html.dart';

class LatestService extends CoreService {
  Future<List<LatestManga>> latest() async {
    String url = KomikuUrl.baseUrl;

    Document? document = await getBodyFromUrl(url);
    List<Map<String, String>> result = [];

    if (document != null) {
      List<Element> root = document.querySelectorAll('#Terbaru > .ls4w > .ls4');
      for (Element elm in root) {
        String title = elm.querySelector('h4')!.text!.trim();
        String thumb =
            elm.querySelector('.ls4v > a > img')!.getAttribute('data-src')!;

        List<String> typeRelease =
            elm.querySelector('.ls4j > .ls4s')!.text!.split(' ');

        String type = typeRelease[0].trim();
        String release =
            typeRelease.getRange(2, typeRelease.length).join(' ').trim();

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
