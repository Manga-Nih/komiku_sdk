import 'package:komiku_sdk/src/enums/manga_type.dart';
import 'package:komiku_sdk/src/helpers/formatter.dart';
import 'package:komiku_sdk/src/helpers/util.dart';
import 'package:komiku_sdk/src/models/core_manga.dart';

class PopularManga extends CoreManga {
  final String reader;

  PopularManga(
    String title,
    String thumb,
    MangaType type,
    String release,
    String? detailEndpoint,
    String? chapterEndpoint,
    this.reader,
  ) : super(title, thumb, type, release, detailEndpoint, chapterEndpoint);

  static List<PopularManga> fromJson(List<Map<String, String?>> listJson) {
    List<PopularManga> list = [];

    for (Map<String, String?> elm in listJson) {
      list.add(
        PopularManga(
          elm['title'] ?? '',
          elm['thumb'] != null ? Formatter.cleanUrl(elm['thumb']!) : '',
          elm['type'] != null ? Util.getType(elm['type']!) : MangaType.none,
          elm['release'] ?? '',
          elm['detail_endpoint'] != null
              ? Formatter.detailTrim(elm['detail_endpoint']!)
              : null,
          elm['chapter_endpoint'] != null
              ? Formatter.chapterTrim(elm['chapter_endpoint']!)
              : null,
          elm['reader'] ?? '',
        ),
      );
    }

    return list;
  }

  @override
  String toString() {
    String print = 'Popular Manga';
    print += '\n Title\t\t\t: $title';
    print += '\n Thumbnail\t\t: $thumb';
    print += '\n Type\t\t\t: ${Util.toCapital(type.name)}';
    print += '\n Reader\t\t\t: $reader';
    print += '\n Release\t\t: $release';
    print += '\n Detail Endpoint\t: $detailEndpoint';
    print += '\n Chapter Endpoint\t: $chapterEndpoint';

    return print;
  }
}
