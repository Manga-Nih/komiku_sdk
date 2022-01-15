# Komiku SDK

# API

## Latest Manga

1. Get latest manga, manhua and manhwa.

```dart
Komiku komiku = Komiku();
List<LatestManga> latests = komiku.latest();
```

2. Get latest manga.

```dart
Komiku komiku = Komiku();
List<LatestManga> latests = komiku.latest(mangaType: MangaType.manga);
```

3. Get latest manhua.

```dart
Komiku komiku = Komiku();
List<LatestManga> latests = komiku.latest(mangaType: MangaType.manhua);
```

4. Get latest manhwa.

```dart
Komiku komiku = Komiku();
List<LatestManga> latests = komiku.latest(mangaType: MangaType.manhwa);
```

## Popular Manga

1. Get popular manga, manhua and manhwa.

```dart
Komiku komiku = Komiku();
List<PopularManga> popular = komiku.popular();
```

2. Get popular manga.

```dart
Komiku komiku = Komiku();
List<PopularManga> popular = komiku.popular(mangaType: MangaType.manga);
```

3. Get popular manhua.

```dart
Komiku komiku = Komiku();
List<PopularManga> popular = komiku.popular(mangaType: MangaType.manhua);
```

4. Get popular manhwa.

```dart
Komiku komiku = Komiku();
List<PopularManga> popular = komiku.popular(mangaType: MangaType.manhwa);
```

## Search Manga

1. Search manga, manhua and manhwa.

```dart
Komiku komiku = Komiku();
List<Manga> popular = komiku.search(keyword: 'one piece');
```

## All Manga, Manhua and Manhwa

1. Get all manga.

```dart
Komiku komiku = Komiku();
List<Manga> manga = komiku.allManga();

List<Manga> manga = komiku.allManga(page: 5);
```

2. Get all manhua.

```dart
Komiku komiku = Komiku();
List<Manga> manhua = komiku.allManhua();

List<Manga> manhua = komiku.allManhua(page: 5);
```

3. Get all manhwa.

```dart
Komiku komiku = Komiku();
List<Manga> manhwa = komiku.allManhwa();

List<Manga> manhwa = komiku.allManhwa(page: 5);
```

4. Get all manga, manhua and manhwa by genre.

```dart
Komiku komiku = Komiku();
List<Manga> manga = komiku.allMangaByGenre(genreEndpoint: 'comedy');

List<Manga> manga = komiku.allMangaByGenre(genreEndpoint: 'super-power');

List<Manga> manga = komiku.allMangaByGenre(page: 5, genreEndpoint: 'action');
```
