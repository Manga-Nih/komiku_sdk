import 'package:komiku_sdk/src/enums/manga_type.dart';

abstract class CoreManga {
  final String title;
  final String thumb;
  final MangaType type;
  final String detailEndpoint;

  CoreManga(
    this.title,
    this.thumb,
    this.type,
    this.detailEndpoint,
  );
}
