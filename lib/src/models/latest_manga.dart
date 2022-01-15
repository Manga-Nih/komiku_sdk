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
    required String detailEndpoint,
    required this.release,
    required this.chapterEndpoint,
  }) : super(title, thumb, type, detailEndpoint);

  static List<LatestManga> fromJson(List<Map<String, String?>> listJson) {
    List<LatestManga> list = [];

    for (Map<String, String?> elm in listJson) {
      list.add(
        LatestManga(
          title: elm['title'] ?? '',
          thumb: elm['thumb'] != null ? Formatter.cleanUrl(elm['thumb']!) : '',
          type:
              elm['type'] != null ? Util.getType(elm['type']!) : MangaType.none,
          release: elm['release'] ?? '',
          detailEndpoint: elm['detail_endpoint'] != null
              ? Formatter.detailTrim(elm['detail_endpoint']!)
              : '',
          chapterEndpoint: elm['chapter_endpoint'] != null
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
    print += '\n Type\t\t\t: ${Util.toCapital(type.name)}';
    print += '\n Release\t\t: $release';
    print += '\n Detail Endpoint\t: $detailEndpoint';
    print += '\n Chapter Endpoint\t: $chapterEndpoint';

    return print;
  }
}
