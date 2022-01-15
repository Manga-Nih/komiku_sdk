import 'package:komiku_sdk/src/enums/manga_type.dart';
import 'package:komiku_sdk/src/helpers/formatter.dart';
import 'package:komiku_sdk/src/helpers/util.dart';
import 'package:komiku_sdk/src/models/core_manga.dart';

class SearchManga extends CoreManga {
  final String description;
  final String firstChapter;
  final String firstChapterEndpoint;
  final String lastChapter;
  final String lastChapterEndpoint;

  SearchManga({
    required String title,
    required String thumb,
    required MangaType type,
    required String detailEndpoint,
    required this.description,
    required this.firstChapter,
    required this.firstChapterEndpoint,
    required this.lastChapter,
    required this.lastChapterEndpoint,
  }) : super(title, thumb, type, detailEndpoint);

  static List<SearchManga> fromJson(List<Map<String, String?>> listJson) {
    List<SearchManga> list = [];

    for (Map<String, String?> elm in listJson) {
      list.add(
        SearchManga(
          title: elm['title'] ?? '',
          thumb: elm['thumb'] != null ? Formatter.cleanUrl(elm['thumb']!) : '',
          type:
              elm['type'] != null ? Util.getType(elm['type']!) : MangaType.none,
          description: elm['description'] ?? '',
          detailEndpoint: elm['detail_endpoint'] != null
              ? Formatter.detailTrim(elm['detail_endpoint']!)
              : '',
          firstChapter: elm['first_chapter'] ?? '',
          firstChapterEndpoint: elm['first_chapter_endpoint'] != null
              ? Formatter.chapterTrim(elm['first_chapter_endpoint']!)
              : '',
          lastChapter: elm['last_chapter'] ?? '',
          lastChapterEndpoint: elm['last_chapter_endpoint'] != null
              ? Formatter.chapterTrim(elm['last_chapter_endpoint']!)
              : '',
        ),
      );
    }

    return list;
  }

  @override
  String toString() {
    String print = 'Search Manga';
    print += '\n Title\t\t\t: $title';
    print += '\n Thumbnail\t\t: $thumb';
    print += '\n Type\t\t\t: ${Util.toCapital(type.name)}';
    print += '\n Description\t\t: $description';
    print += '\n Detail Endpoint\t: $detailEndpoint';
    print += '\n First Chapter\t\t: $firstChapter';
    print += '\n First Chapter Endpoint\t: $firstChapterEndpoint';
    print += '\n Last Chapter\t\t: $lastChapter';
    print += '\n Last Chapter Endpoint\t: $lastChapterEndpoint';

    return print;
  }
}
