import 'package:intl/intl.dart';
import 'package:komiku_sdk/src/helpers/formatter.dart';

class Chapter {
  final String title;
  final String endpoint;
  final DateTime date;

  Chapter({
    required this.title,
    required this.endpoint,
    required this.date,
  });

  static List<Chapter> fromJson(List<Map<String, String>> json) {
    List<Chapter> chapters = [];
    DateFormat format = DateFormat('d/M/y');

    for (Map<String, String> item in json) {
      chapters.add(Chapter(
        title: item['chapter']!,
        endpoint: Formatter.chapterTrim(item['chapter_endpoint']!),
        date: format.parse(item['date']!, true),
      ));
    }

    return chapters;
  }

  static Chapter fromJsonFirst(Map<String, String> json) {
    DateFormat format = DateFormat('d/M/y');

    return Chapter(
      title: json['chapter']!,
      endpoint: Formatter.chapterTrim(json['chapter_endpoint']!),
      date: format.parse(json['date']!, true),
    );
  }

  Map<String, String> toJson() {
    DateFormat format = DateFormat('d/M/y');

    return {
      'chapter': title,
      'chapter_endpoint': endpoint,
      'date': format.format(date),
    };
  }
}
