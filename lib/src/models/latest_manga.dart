import 'package:komiku_sdk/src/helpers/formatter.dart';
import 'package:komiku_sdk/src/models/core_manga.dart';

class LatestManga extends CoreManga {
  LatestManga(
    String title,
    String thumb,
    String type,
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
          elm['type'] ?? '',
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
}
