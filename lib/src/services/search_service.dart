import 'package:komiku_sdk/src/constants/komiku_url.dart';
import 'package:komiku_sdk/src/models/search_manga.dart';
import 'package:komiku_sdk/src/services/core_service.dart';
import 'package:universal_html/html.dart';

class SearchService extends CoreService {
  Future<List<SearchManga>> search(String keyword) async {
    String url = KomikuUrl.baseUrl + '/cari/?post_type=manga&s=' + keyword;

    Document? document = await getBodyFromUrl(url);
    List<Map<String, String?>> result = [];

    if (document != null) {
      List<Element> root =
          document.querySelectorAll('.perapih > section > .daftar > .bge');

      for (Element elm in root) {
        String title = elm.querySelector('.kan > a > h3')!.text!.trim();
        String thumb =
            elm.querySelector('.bgei > a > img')!.getAttribute('data-src')!;
        String type = elm.querySelector('.bgei > a > div > b')!.text!;
        String description = elm.querySelector('.kan > p')!.text!.trim();
        String detailEndpoint =
            elm.querySelector('.bgei > a')!.getAttribute('href')!;

        String firstChapter = elm
            .querySelectorAll('.kan > .new1')
            .first
            .querySelectorAll('a > span')
            .last
            .text!;
        String firstChapterEndpoint = elm
            .querySelectorAll('.kan > .new1')
            .first
            .querySelectorAll('a')
            .last
            .getAttribute('href')!;

        String lastChapter = elm
            .querySelectorAll('.kan > .new1')
            .last
            .querySelectorAll('a > span')
            .last
            .text!;
        String lastChapterEndpoint = elm
            .querySelectorAll('.kan > .new1')
            .last
            .querySelectorAll('a')
            .last
            .getAttribute('href')!;

        result.add({
          'title': title,
          'thumb': thumb,
          'type': type,
          'description': description,
          'detail_endpoint': detailEndpoint,
          'first_chapter': firstChapter,
          'first_chapter_endpoint': firstChapterEndpoint,
          'last_chapter': lastChapter,
          'last_chapter_endpoint': lastChapterEndpoint,
        });
      }
    }

    return SearchManga.fromJson(result);
  }
}
