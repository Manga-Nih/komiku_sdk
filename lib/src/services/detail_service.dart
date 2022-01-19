import 'package:komiku_sdk/src/constants/komiku_url.dart';
import 'package:komiku_sdk/src/models/chapter_detail.dart';
import 'package:komiku_sdk/src/models/manga_detail.dart';
import 'package:komiku_sdk/src/services/core_service.dart';
import 'package:universal_html/html.dart';

class DetailService extends CoreService {
  Future<MangaDetail> manga(String slug) async {
    String url = KomikuUrl.detailUrl + '/' + slug + '/';

    Document? document = await getBodyFromUrl(url);
    Map<String, dynamic> result = {};

    if (document != null) {
      Element root = document.querySelector('.series > .perapih > article')!;
      List<Element> listInfo =
          root.querySelectorAll('table.inftable > tbody > tr');
      List<Element> listGenre =
          root.querySelectorAll('#Informasi > .genre > li');

      String title = root.querySelector('#Judul > h1')!.text!.trim();
      String thumb =
          root.querySelector('#Informasi > .ims > img')!.getAttribute('src')!;

      // Info
      String titleId = listInfo[0].querySelectorAll('td').last.text!;
      String type = listInfo[1].querySelectorAll('td').last.text!;
      String writer = listInfo[3].querySelectorAll('td').last.text!;
      String status = listInfo[4].querySelectorAll('td').last.text!;
      String reader = listInfo[6].querySelectorAll('td').last.text!;
      String readDirection = listInfo[7].querySelectorAll('td').last.text!;

      // Genre
      List<String> listGenreTemp = [];
      for (Element item in listGenre) {
        listGenreTemp.add(item.text!);
      }
      String genre = listGenreTemp.join(', ');

      // Summary and synopsis
      List<Element> summariesSynopsisElement =
          root.querySelector('#Sinopsis')!.children;
      int indexStart = summariesSynopsisElement
          .indexWhere((element) => element.tagName == 'H3');
      int indexLast = summariesSynopsisElement
          .indexWhere((element) => element.tagName == 'H2');

      // Summary
      List<String> listSummary = [];
      for (int i = indexStart + 1; i < indexLast; i++) {
        String summary = summariesSynopsisElement[i].text!.trim();
        if (summary != '') {
          listSummary.add(summary);
        }
      }

      // Synopsis
      List<String> listSynopsis = [];
      for (int i = indexLast + 1; i < summariesSynopsisElement.length; i++) {
        listSynopsis.add(summariesSynopsisElement[i].text!.trim());
      }
      String synopsis = listSynopsis.join(' ');

      // Chapter
      List<Map<String, String>> chapters = [];
      List<Element> chaptersElement =
          root.querySelectorAll('#Chapter > table > tbody > tr');
      for (int i = 0; i < chaptersElement.length; i++) {
        Element item = chaptersElement[i];
        if (i != 0) {
          String chapter = item.children.first.text!.trim();
          String chapterEndpoint =
              item.children.first.querySelector('a')!.getAttribute('href')!;
          String date = item.children.last.text!.trim();

          chapters.add({
            'chapter': chapter,
            'chapter_endpoint': chapterEndpoint,
            'date': date,
          });
        }
      }

      result = {
        'title': title,
        'title_id': titleId,
        'thumb': thumb,
        'type': type,
        'writer': writer,
        'status': status,
        'reader': reader,
        'read_direction': readDirection,
        'genre': genre,
        'summaries': listSummary,
        'synopsis': synopsis,
        'chapters': chapters,
      };
    }

    return MangaDetail.fromJson(result);
  }

  Future<ChapterDetail> chapter(String slug) async {
    String url = KomikuUrl.chapterUrl + '/' + slug + '/';

    Document? document = await getBodyFromUrl(url);
    Map<String, dynamic> result = {};

    if (document != null) {
      Element root = document.querySelector('.content')!;

      String title = root.querySelectorAll('#Judul > h1').first.text!.trim();
      String chapter = root.querySelector('.nxpr > span')!.text!.trim();

      // Prev and next chapter endpoint
      late String prevChapterEndpoint;
      late String nextChapterEndpoint;
      List<Element> prevNextElement = root.querySelectorAll('.nxpr > a');
      for (Element item in prevNextElement) {
        String dataIcon = item.querySelector('svg')!.getAttribute('data-icon')!;

        if (dataIcon == 'caret-right') {
          nextChapterEndpoint = item.getAttribute('href')!;
        }
        if (dataIcon == 'caret-left') {
          prevChapterEndpoint = item.getAttribute('href')!;
        }
      }

      // Images
      List<Map<String, String>> images = [];
      List<Element> imagesElement = root.querySelectorAll('#Baca_Komik > img');
      for (Element item in imagesElement) {
        String alt = item.getAttribute('alt')!;
        String image = item.getAttribute('src')!;

        images.add({
          'alt': alt,
          'image': image,
        });
      }

      result = {
        'title': title,
        'chapter': chapter,
        'prev_chapter_endpoint': prevChapterEndpoint,
        'next_chapter_endpoint': nextChapterEndpoint,
        'images': images,
      };
    }

    return ChapterDetail.fromJson(result);
  }
}
