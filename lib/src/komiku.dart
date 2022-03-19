import 'package:komiku_sdk/src/enums/manga_type.dart';
import 'package:komiku_sdk/src/models/chapter_detail.dart';
import 'package:komiku_sdk/src/models/latest_manga.dart';
import 'package:komiku_sdk/src/models/manga_detail.dart';
import 'package:komiku_sdk/src/models/popular_manga.dart';
import 'package:komiku_sdk/src/models/manga.dart';
import 'package:komiku_sdk/src/services/detail_service.dart';
import 'package:komiku_sdk/src/services/latest_service.dart';
import 'package:komiku_sdk/src/services/manga_service.dart';
import 'package:komiku_sdk/src/services/popular_service.dart';
import 'package:komiku_sdk/src/services/search_service.dart';

class Komiku {
  final LatestService _latestService = LatestService();
  final PopularService _popularService = PopularService();
  final SearchService _searchService = SearchService();
  final MangaService _mangaService = MangaService();
  final DetailService _detailService = DetailService();

  // Dart singleton
  Komiku._internal();
  static final Komiku _instance = Komiku._internal();
  static Komiku get instance => _instance;

  /// Get latest manga/manhua/manhwa.
  /// If mangaType variable not fill it.
  /// Its will be retrieve latest manga, manhwa and manhua.
  Future<List<LatestManga>> latest({MangaType? mangaType}) {
    return _latestService.latest(mangaType);
  }

  /// Get popular manga/manhua/manhwa.
  /// If mangaType variable not fill it.
  /// Its will be retrieve popular manga, manhwa and manhua.
  ///
  /// [chapterEndpoint] always null, if [mangaType] filled.
  Future<List<PopularManga>> popular({MangaType? mangaType}) {
    return _popularService.popular(mangaType);
  }

  /// Get search manga by keyword.
  Future<List<Manga>> search({required String keyword}) {
    return _searchService.search(keyword);
  }

  /// Get all manga.
  Future<List<Manga>> allManga({int? page}) {
    return _mangaService.allManga(page, MangaType.manga);
  }

  /// Get all manhua.
  Future<List<Manga>> allManhua({int? page}) {
    return _mangaService.allManga(page, MangaType.manhua);
  }

  /// Get all manhwa.
  Future<List<Manga>> allManhwa({int? page}) {
    return _mangaService.allManga(page, MangaType.manhwa);
  }

  /// Get all manga/manhua/manhwa by genre.
  Future<List<Manga>> allMangaByGenre(
      {int? page, required String genreEndpoint}) {
    return _mangaService.allMangaByGenre(page, genreEndpoint);
  }

  /// Get detail manga by detailEndpoint.
  Future<MangaDetail> detail({required String detailEndpoint}) {
    return _detailService.manga(detailEndpoint);
  }

  /// Get detail chapter by chapterEndpoint.
  Future<ChapterDetail> chapter({required String chapterEndpoint}) {
    return _detailService.chapter(chapterEndpoint);
  }
}
