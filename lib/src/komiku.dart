import 'package:komiku_sdk/src/enums/manga_type.dart';
import 'package:komiku_sdk/src/models/latest_manga.dart';
import 'package:komiku_sdk/src/models/popular_manga.dart';
import 'package:komiku_sdk/src/models/search_manga.dart';
import 'package:komiku_sdk/src/services/latest_service.dart';
import 'package:komiku_sdk/src/services/popular_service.dart';
import 'package:komiku_sdk/src/services/search_service.dart';

class Komiku {
  final LatestService _latestService = LatestService();
  final PopularService _popularService = PopularService();
  final SearchService _searchService = SearchService();

  /// Get latest manga/manhwa/manhua.
  /// If mangaType variable not fill it.
  /// Its will be retrieve latest manga, manhwa and manhua.
  Future<List<LatestManga>> latest({MangaType? mangaType}) {
    return _latestService.latest(mangaType);
  }

  /// Get popular manga/manhwa/manhua.
  /// If mangaType variable not fill it.
  /// Its will be retrieve popular manga, manhwa and manhua.
  ///
  /// [chapterEndpoint] always null, if [mangaType] filled.
  Future<List<PopularManga>> popular({MangaType? mangaType}) {
    return _popularService.popular(mangaType);
  }

  /// Get search manga by keyword.
  Future<List<SearchManga>> search({required String keyword}) {
    return _searchService.search(keyword);
  }
}
