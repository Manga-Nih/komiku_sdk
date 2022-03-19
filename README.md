# Komiku SDK

# Development

## Lefthook

- To improve style and format code.
- Install [lefhook](https://github.com/evilmartians/lefthook).
- Add lefthook executable to path environment.
- Open Manga nih project and execute lefthook command.
  ```bash
  lefthook install
  ```

# API

## Latest Manga

1. Get latest manga, manhua and manhwa.

```dart
Komiku komiku = Komiku();
List<LatestManga> latests = await komiku.latest();
```

2. Get latest manga.

```dart
Komiku komiku = Komiku();
List<LatestManga> latests = await komiku.latest(mangaType: MangaType.manga);
```

3. Get latest manhua.

```dart
Komiku komiku = Komiku();
List<LatestManga> latests = await komiku.latest(mangaType: MangaType.manhua);
```

4. Get latest manhwa.

```dart
Komiku komiku = Komiku();
List<LatestManga> latests = await komiku.latest(mangaType: MangaType.manhwa);
```

## Popular Manga

1. Get popular manga, manhua and manhwa.

```dart
Komiku komiku = Komiku();
List<PopularManga> popular = await komiku.popular();
```

2. Get popular manga.

```dart
Komiku komiku = Komiku();
List<PopularManga> popular = await komiku.popular(mangaType: MangaType.manga);
```

3. Get popular manhua.

```dart
Komiku komiku = Komiku();
List<PopularManga> popular = await komiku.popular(mangaType: MangaType.manhua);
```

4. Get popular manhwa.

```dart
Komiku komiku = Komiku();
List<PopularManga> popular = await komiku.popular(mangaType: MangaType.manhwa);
```

## Search Manga

1. Search manga, manhua and manhwa.

```dart
Komiku komiku = Komiku();
List<Manga> popular = await komiku.search(keyword: 'one piece');
```

## Genre

1. Get all manga.

```dart
List<Genre> allGenre = Genre.all();
```

2. Find genre.

```dart
Genre genre = Genre.find('action');
```

## Detail Manga and Chapter

1. Get detail manga by slug/detailEndpoint.

```dart
Komiku komiku = Komiku();
MangaDetail detail = await komiku.detail(detailEndpoint: 'martial-peak');
```

2. Get chapter manga by slug/chapterEndpoint.

```dart
Komiku komiku = Komiku();
MangaDetail detail = await komiku.chapter(chapterEndpoint: 'martial-peak-chapter-1870');
```

## All Manga, Manhua and Manhwa

1. Get all manga.

```dart
Komiku komiku = Komiku();
List<Manga> manga = await komiku.allManga();

List<Manga> manga = await komiku.allManga(page: 5);
```

2. Get all manhua.

```dart
Komiku komiku = Komiku();
List<Manga> manhua = await komiku.allManhua();

List<Manga> manhua = await komiku.allManhua(page: 5);
```

3. Get all manhwa.

```dart
Komiku komiku = Komiku();
List<Manga> manhwa = await komiku.allManhwa();

List<Manga> manhwa = await komiku.allManhwa(page: 5);
```

4. Get all manga, manhua and manhwa by genre.

```dart
Komiku komiku = Komiku();
List<Manga> manga = await komiku.allMangaByGenre(genreEndpoint: 'comedy');

List<Manga> manga = await komiku.allMangaByGenre(genreEndpoint: 'super-power');

List<Manga> manga = await komiku.allMangaByGenre(page: 5, genreEndpoint: 'action');
```
