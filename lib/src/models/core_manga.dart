abstract class CoreManga {
  final String title;
  final String thumb;
  final String type;
  final String release;
  final String detailEndpoint;
  final String chapterEndpoint;

  CoreManga(
    this.title,
    this.thumb,
    this.type,
    this.release,
    this.detailEndpoint,
    this.chapterEndpoint,
  );
}
