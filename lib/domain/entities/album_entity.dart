class Album {
  final String id;
  final String schoolId;
  final String name;
  final double price;
  final DateTime releaseDate;
  final String coverImage;
  final int totalStickers;
  final List<Sticker> commonStickers;
  final List<Sticker> frameStickers;
  final List<Sticker> legendStickers;
  final List<Sticker> a4Stickers;

  Album({
    required this.id,
    required this.schoolId,
    required this.name,
    required this.price,
    required this.releaseDate,
    required this.coverImage,
    required this.totalStickers,
    this.commonStickers = const [],
    this.frameStickers = const [],
    this.legendStickers = const [],
    this.a4Stickers = const [],
  });
}

class Sticker {
  final int number;
  final String name;

  Sticker({
    required this.number,
    required this.name,
  });
}
