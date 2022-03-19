import 'package:test/test.dart';
import 'package:komiku_sdk/models.dart';

void main() {
  test('Get existing genre', () {
    Genre? genre = Genre.find('comedy');

    expect(genre, isNot(null));
  });

  test('Get don\'t exist genre', () {
    Genre? genre = Genre.find('comedyasdadas');

    expect(genre, null);
  });

  test('Get all genre', () {
    List<Genre> genres = Genre.all();
    int count = genres.length;

    expect(count, 62);
  });
}
