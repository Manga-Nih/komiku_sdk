import 'package:komiku_sdk/src/helpers/formatter.dart';

class ChapterDetail {
  final String endpoint;
  final String title;
  final String chapter;
  final String? prevChapterEndpoint;
  final String? nextChapterEndpoint;
  final List<ChapterImage> images;

  ChapterDetail({
    required this.endpoint,
    required this.title,
    required this.chapter,
    required this.prevChapterEndpoint,
    required this.nextChapterEndpoint,
    required this.images,
  });

  factory ChapterDetail.fromJson(Map<String, dynamic> json) {
    return ChapterDetail(
      endpoint: json['chapter_endpoint'],
      title: json['title'],
      chapter: json['chapter'],
      prevChapterEndpoint: json['prev_chapter_endpoint'] != null
          ? Formatter.chapterTrim(json['prev_chapter_endpoint'])
          : null,
      nextChapterEndpoint: json['next_chapter_endpoint'] != null
          ? Formatter.chapterTrim(json['next_chapter_endpoint'])
          : null,
      images: ChapterImage.fromJson(json['images']),
    );
  }

  @override
  String toString() {
    String print = 'Detail Manga';
    print += '\n Chapter Endpoint\t\t: $endpoint';
    print += '\n Title\t\t\t: $title';
    print += '\n Chapter\t\t: $chapter';
    print += '\n Prev Chapter Endpoint\t: $prevChapterEndpoint';
    print += '\n Next Chapter Endpoint\t: $nextChapterEndpoint';
    print += '\n Count Images\t\t: ${images.length}';
    print += '\n Last Image';
    print += '\n \tAlt\t\t: ${images.first.alt}';
    print += '\n \tImage\t\t: ${images.first.image}';

    return print;
  }
}

class ChapterImage {
  final String alt;
  final String image;

  ChapterImage({required this.alt, required this.image});

  static List<ChapterImage> fromJson(List<Map<String, String>> json) {
    List<ChapterImage> result = [];

    for (Map<String, String> item in json) {
      result.add(ChapterImage(alt: item['alt']!, image: item['image']!));
    }

    return result;
  }
}
