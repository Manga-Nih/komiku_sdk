import 'package:intl/intl.dart';
import 'package:komiku_sdk/enum.dart';
import 'package:komiku_sdk/src/helpers/formatter.dart';
import 'package:komiku_sdk/src/helpers/util.dart';

class MangaDetail {
  final String title;
  final String titleId;
  final String thumb;
  final MangaType type;
  final String typeName;
  final String writer;
  final String status;
  final String reader;
  final String readDirection;
  final String genre;
  final List<String> summaries;
  final String synopsis;
  final List<Chapter> chapters;

  MangaDetail({
    required this.title,
    required this.titleId,
    required this.thumb,
    required this.type,
    required this.typeName,
    required this.writer,
    required this.status,
    required this.reader,
    required this.readDirection,
    required this.genre,
    required this.summaries,
    required this.synopsis,
    required this.chapters,
  });

  factory MangaDetail.fromJson(Map<String, dynamic> json) {
    return MangaDetail(
      title: json['title'],
      titleId: json['title_id'],
      thumb: Formatter.cleanUrl(json['thumb']),
      type: Util.getType(json['type']),
      typeName: json['type'],
      writer: json['writer'],
      status: json['status'],
      reader: json['reader'],
      readDirection: json['read_direction'],
      genre: json['genre'],
      summaries: json['summaries'],
      synopsis: json['synopsis'],
      chapters: Chapter.fromJson(json['chapters']),
    );
  }

  @override
  String toString() {
    String print = 'Detail Manga';
    print += '\n Title\t\t\t: $title';
    print += '\n Title ID\t\t: $titleId';
    print += '\n Thumbnail\t\t: $thumb';
    print += '\n Type\t\t\t: $typeName';
    print += '\n Writer\t\t\t: $writer';
    print += '\n Status\t\t\t: $status';
    print += '\n Reader\t\t\t: $reader';
    print += '\n Read Direction\t\t: $readDirection';
    print += '\n Genre\t\t\t: $genre';
    print += '\n Summary\t\t: $summaries';
    print += '\n Synopsis\t\t: $synopsis';
    print += '\n Count Chapters\t\t: ${chapters.length}';

    return print;
  }
}

class Chapter {
  final String chapter;
  final String chapterEndpoint;
  final DateTime date;

  Chapter({
    required this.chapter,
    required this.chapterEndpoint,
    required this.date,
  });

  static List<Chapter> fromJson(List<Map<String, String>> json) {
    List<Chapter> chapters = [];

    for (Map<String, String> item in json) {
      chapters.add(Chapter(
        chapter: item['chapter']!,
        chapterEndpoint: Formatter.chapterTrim(item['chapter_endpoint']!),
        date: DateFormat.yMd().parse(item['date']!),
      ));
    }

    return chapters;
  }
}
