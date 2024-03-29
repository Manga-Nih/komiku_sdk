library komiku_sdk;

import 'package:komiku_sdk/src/helpers/util.dart';

class Genre {
  final String name;
  final String endpoint;

  static final List<String> _genreList = [
    '4-Koma',
    'Action',
    'Adventure',
    'Comedy',
    'Cooking',
    'Crime',
    'Demons',
    'Drama',
    'Ecchi',
    'Fantasy',
    'Game',
    'Gender Bender',
    'Gore',
    'Harem',
    'Historical',
    'Horror',
    'Isekai',
    'Josei',
    'Life',
    'Magic',
    'Manhua',
    'Manhwa',
    'Martial Arts',
    'Mature',
    'Mecha',
    'Medical',
    'Military',
    'Monsters',
    'Music',
    'Mystery',
    'Namaikizakari',
    'One Shot',
    'Overpower',
    'Parodi',
    'Police',
    'Psychological',
    'Reincarnatio',
    'Reincarnation',
    'Romance',
    'School',
    'School life',
    'Sci-f',
    'Sci-fi',
    'Seinen',
    'Shotacon',
    'Shoujo',
    'Shoujo Ai',
    'Shounen',
    'Shounen Ai',
    'Slice of Life',
    'Sport',
    'Sports',
    'Super Power',
    'Supernatural',
    'Thriller',
    'Tragedy',
    'Urban',
    'Vampire',
    'Vampires',
    'Villainess',
    'Webtoons',
    'Yuri',
  ];

  Genre({
    required this.name,
    required this.endpoint,
  });

  static List<Genre> all() {
    List<Genre> genre = [];

    for (String item in _genreList) {
      genre.add(Genre(name: item, endpoint: Util.toSlug(item)));
    }

    return genre;
  }

  static Genre? find(String genre) {
    try {
      String result = _genreList.firstWhere(
        (element) => element.toLowerCase() == genre.toLowerCase(),
      );

      return Genre(name: result, endpoint: Util.toSlug(result));
    } catch (e) {
      return null;
    }
  }

  @override
  String toString() {
    String print = 'Genre';
    print += '\n Name\t\t: $name';
    print += '\n Endpoint\t: $endpoint';

    return print;
  }
}
