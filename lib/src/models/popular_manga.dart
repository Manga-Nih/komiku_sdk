import 'package:komiku_sdk/src/enums/manga_type.dart';
import 'package:komiku_sdk/src/helpers/formatter.dart';
import 'package:komiku_sdk/src/helpers/util.dart';
import 'package:komiku_sdk/src/models/core_manga.dart';

class PopularManga extends CoreManga {
  final String reader;
  final String? chapterEndpoint;

  PopularManga({
    required String title,
    required String thumb,
    required MangaType type,
    required String release,
    String? detailEndpoint,
    this.chapterEndpoint,
    required this.reader,
  }) : super(title, thumb, type, release, detailEndpoint);

  static List<PopularManga> fromJson(List<Map<String, String?>> listJson) {
    List<PopularManga> list = [];

    for (Map<String, String?> elm in listJson) {
      list.add(
        PopularManga(
          title: elm['title'] ?? '',
          thumb: elm['thumb'] != null ? Formatter.cleanUrl(elm['thumb']!) : '',
          type:
              elm['type'] != null ? Util.getType(elm['type']!) : MangaType.none,
          release: elm['release'] ?? '',
          detailEndpoint: elm['detail_endpoint'] != null
              ? Formatter.detailTrim(elm['detail_endpoint']!)
              : null,
          chapterEndpoint: elm['chapter_endpoint'] != null
              ? Formatter.chapterTrim(elm['chapter_endpoint']!)
              : null,
          reader: elm['reader'] ?? '',
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
