class Genre {
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
    'omedy',
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

  static List<String> all() {
    return _genreList;
  }

  static String? find(String genre) {
    try {
      return _genreList.firstWhere(
        (element) => element.toLowerCase() == genre.toLowerCase(),
      );
    } catch (e) {
      return null;
    }
  }
}
