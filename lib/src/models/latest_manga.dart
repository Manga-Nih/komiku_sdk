import 'package:komiku_sdk/src/enums/manga_type.dart';
import 'package:komiku_sdk/src/helpers/util.dart';
import 'package:komiku_sdk/src/helpers/formatter.dart';
import 'package:komiku_sdk/src/models/core_manga.dart';

class LatestManga extends CoreManga {
  LatestManga(
    String title,
    String thumb,
    MangaType? type,
    String release,
    String detailEndpoint,
    String chapterEndpoint,
  ) : super(title, thumb, type, release, detailEndpoint, chapterEndpoint);

  static List<LatestManga> fromJson(List<Map<String, String>> listJson) {
    List<LatestManga> list = [];

    for (Map<String, String> elm in listJson) {
      list.add(
        LatestManga(
          elm['title'] ?? '',
          elm['thumb'] != null ? Formatter.cleanUrl(elm['thumb']!) : '',
          elm['type'] != null ? Util.getType(elm['type']!) : null,
          elm['release'] ?? '',
          elm['detail_endpoint'] != null
              ? Formatter.detailTrim(elm['detail_endpoint']!)
              : '',
          elm['chapter_endpoint'] != null
              ? Formatter.chapterTrim(elm['chapter_endpoint']!)
              : '',
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
    print += '\n Type\t\t\t: $type';
    print += '\n Release\t\t: $release';
    print += '\n Detail Endpoint\t: $detailEndpoint';
    print += '\n Chapter Endpoint\t: $chapterEndpoint';

    return print;
  }
}
