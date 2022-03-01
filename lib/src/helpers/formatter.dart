class Formatter {
  /// Detail trim for get manga slug and remove unnecessary path
  static String detailTrim(String detailEndpoint) {
    String slug = detailEndpoint.split('manga/')[1];
    return slug.replaceAll(RegExp(r'/'), '');
  }

  /// Chapter trim for get chapter slug and remove unnecessary path
  static String chapterTrim(String chapterEndpoint) {
    String slug = chapterEndpoint.split('ch/')[1];
    return slug.replaceAll(RegExp(r'/'), '');
  }

  /// Cleaning url from query
  static String cleanUrl(String url) {
    return url
        .replaceAll(RegExp(r'(\?.*)|(#.*)'), '')
        .replaceAll('thumbnail.komiku.id', 'komiku.co.id');
  }
}
