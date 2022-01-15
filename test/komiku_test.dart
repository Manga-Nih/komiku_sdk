import 'package:flutter_test/flutter_test.dart';
import 'package:komiku_sdk/komiku_sdk.dart';

void main() {
  test('Get latest', () {
    Komiku komiku = Komiku();
    komiku.latest();
  });
}
