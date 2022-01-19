import 'package:universal_html/html.dart';

mixin MangaParser {
  List<Map<String, String?>> mangaDomToMap(Document document) {
    List<Map<String, String?>> result = [];
    List<Element> root =
        document.querySelectorAll('.perapih > section > .daftar > .bge');

    for (Element elm in root) {
      String title = elm.querySelector('.kan > a > h3')!.text!.trim();
      String thumb =
          elm.querySelector('.bgei > a > img')!.getAttribute('data-src')!;
      String type = elm.querySelector('.bgei > a > div > b')!.text!;

      String readerRelease = elm.querySelector('.kan > .judul2')!.text!;
      List<String> listReaderRelease = readerRelease.split('•');
      String reader = listReaderRelease[0].trim();
      String release = listReaderRelease[1].trim();

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
        'reader': reader,
        'release': release,
        'description': description,
        'detail_endpoint': detailEndpoint,
        'first_chapter': firstChapter,
        'first_chapter_endpoint': firstChapterEndpoint,
        'last_chapter': lastChapter,
        'last_chapter_endpoint': lastChapterEndpoint,
      });
    }

    return result;
  }
}
