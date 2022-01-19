import 'package:komiku_sdk/src/enums/manga_type.dart';
import 'package:komiku_sdk/src/helpers/formatter.dart';
import 'package:komiku_sdk/src/helpers/util.dart';
import 'package:komiku_sdk/src/models/core_manga.dart';

class PopularManga extends CoreManga {
  final String reader;
  final String release;
  final String? chapterEndpoint;

  PopularManga({
    required String title,
    required String thumb,
    required MangaType type,
    required String typeName,
    required String detailEndpoint,
    required this.release,
    required this.reader,
    this.chapterEndpoint,
  }) : super(title, thumb, type, typeName, detailEndpoint);

  static List<PopularManga> fromJson(List<Map<String, String?>> listJson) {
    List<PopularManga> list = [];

    for (Map<String, String?> elm in listJson) {
      list.add(
        PopularManga(
          title: elm['title']!,
          thumb: Formatter.cleanUrl(elm['thumb']!),
          type: Util.getType(elm['type']!),
          typeName: elm['type']!,
          release: elm['release']!,
          detailEndpoint: Formatter.detailTrim(elm['detail_endpoint']!),
          chapterEndpoint: elm['chapter_endpoint'] != null
              ? Formatter.chapterTrim(elm['chapter_endpoint']!)
              : null,
          reader: elm['reader']!,
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
    print += '\n Type\t\t\t: $typeName';
    print += '\n Reader\t\t\t: $reader';
    print += '\n Release\t\t: $release';
    print += '\n Detail Endpoint\t: $detailEndpoint';
    print += '\n Chapter Endpoint\t: $chapterEndpoint';

    return print;
  }
}
