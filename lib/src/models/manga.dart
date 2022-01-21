import 'package:komiku_sdk/src/enums/manga_type.dart';
import 'package:komiku_sdk/src/helpers/formatter.dart';
import 'package:komiku_sdk/src/helpers/util.dart';
import 'package:komiku_sdk/src/models/core_manga.dart';

class Manga extends CoreManga {
  final String? reader;
  final String? release;
  final String description;
  final String firstChapter;
  final String firstChapterEndpoint;
  final String lastChapter;
  final String lastChapterEndpoint;

  Manga({
    required String title,
    required String thumb,
    required MangaType type,
    required String typeName,
    required String detailEndpoint,
    required this.reader,
    required this.release,
    required this.description,
    required this.firstChapter,
    required this.firstChapterEndpoint,
    required this.lastChapter,
    required this.lastChapterEndpoint,
  }) : super(title, thumb, type, typeName, detailEndpoint);

  static List<Manga> fromJson(List<Map<String, String?>> listJson) {
    List<Manga> list = [];

    for (Map<String, String?> elm in listJson) {
      list.add(
        Manga(
          title: elm['title']!,
          thumb: Formatter.cleanUrl(elm['thumb']!),
          type: Util.getType(elm['type']!),
          typeName: elm['type']!,
          reader: elm['reader'],
          release: elm['release'],
          description: elm['description']!,
          detailEndpoint: Formatter.detailTrim(elm['detail_endpoint']!),
          firstChapter: elm['first_chapter']!,
          firstChapterEndpoint:
              Formatter.chapterTrim(elm['first_chapter_endpoint']!),
          lastChapter: elm['last_chapter']!,
          lastChapterEndpoint:
              Formatter.chapterTrim(elm['last_chapter_endpoint']!),
        ),
      );
    }

    return list;
  }

  Map<String, String?> toJson() {
    return {
      'title': title,
      'thumb': Formatter.cleanUrl(thumb),
      'type': typeName,
      'reader': reader,
      'release': release,
      'description': description,
      'detail_endpoint': Formatter.detailTrim(detailEndpoint),
      'first_chapter': firstChapter,
      'first_chapter_endpoint': Formatter.chapterTrim(firstChapterEndpoint),
      'last_chapter': lastChapter,
      'last_chapter_endpoint': Formatter.chapterTrim(lastChapterEndpoint),
    };
  }

  @override
  String toString() {
    String print = 'Search Manga';
    print += '\n Title\t\t\t: $title';
    print += '\n Thumbnail\t\t: $thumb';
    print += '\n Type\t\t\t: $typeName';
    print += '\n Reader\t\t\t: $reader';
    print += '\n Release\t\t: $release';
    print += '\n Description\t\t: $description';
    print += '\n Detail Endpoint\t: $detailEndpoint';
    print += '\n First Chapter\t\t: $firstChapter';
    print += '\n First Chapter Endpoint\t: $firstChapterEndpoint';
    print += '\n Last Chapter\t\t: $lastChapter';
    print += '\n Last Chapter Endpoint\t: $lastChapterEndpoint';

    return print;
  }
}
