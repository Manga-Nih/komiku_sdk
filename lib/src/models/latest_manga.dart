import 'package:komiku_sdk/src/enums/manga_type.dart';
import 'package:komiku_sdk/src/helpers/util.dart';
import 'package:komiku_sdk/src/helpers/formatter.dart';
import 'package:komiku_sdk/src/models/core_manga.dart';

class LatestManga extends CoreManga {
  final String release;
  final String chapterEndpoint;

  LatestManga({
    required String title,
    required String thumb,
    required MangaType type,
    required String typeName,
    required String detailEndpoint,
    required this.release,
    required this.chapterEndpoint,
  }) : super(title, thumb, type, typeName, detailEndpoint);

  static List<LatestManga> fromJson(List<Map<String, String>> listJson) {
    List<LatestManga> list = [];

    for (Map<String, String> elm in listJson) {
      list.add(
        LatestManga(
          title: elm['title']!,
          thumb: Formatter.cleanUrl(elm['thumb']!),
          type: Util.getType(elm['type']!),
          typeName: elm['type']!,
          release: elm['release']!,
          detailEndpoint: Formatter.detailTrim(elm['detail_endpoint']!),
          chapterEndpoint: Formatter.chapterTrim(elm['chapter_endpoint']!),
        ),
      );
    }

    return list;
  }

  @override
  String toString() {
    String print = 'Latest Manga';
    print += '\n Title\t\t\t: $title';
    print += '\n Thumbnail\t\t: $thumb';
    print += '\n Type\t\t\t: $typeName';
    print += '\n Release\t\t: $release';
    print += '\n Detail Endpoint\t: $detailEndpoint';
    print += '\n Chapter Endpoint\t: $chapterEndpoint';

    return print;
  }
}
