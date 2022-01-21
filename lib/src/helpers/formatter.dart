class Formatter {
  /// Detail trim for get manga slug and remove unnecessary path
  static String detailTrim(String detailEndpoint) {
    List<String> list = detailEndpoint.split('manga/');
    if (list.length > 1) {
      String slug = list[1];
      return slug.replaceAll(RegExp(r'/'), '');
    }

    return list[0];
  }

  /// Chapter trim for get chapter slug and remove unnecessary path
  static String chapterTrim(String chapterEndpoint) {
    List<String> list = chapterEndpoint.split('ch/');
    if (list.length > 1) {
      String slug = list[1];
      return slug.replaceAll(RegExp(r'/'), '');
    }

    return list[0];
  }

  /// Cleaning url from query
  static String cleanUrl(String url) {
    return url.replaceAll(RegExp(r'(\?.*)|(#.*)'), '');
  }
}
