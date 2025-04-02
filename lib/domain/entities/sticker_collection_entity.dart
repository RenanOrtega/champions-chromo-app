class StickerCollection {
  final String id;
  final String userId;
  final List<AlbumCollection> albums;
  const StickerCollection({
    required this.id,
    required this.userId,
    this.albums = const [],
  });
}

class AlbumCollection {
  final String albumId;
  final List<int> ownedCommonStickers;
  final List<int> ownedFrameStickers;
  final List<int> ownedLegendStickers;
  final List<int> ownedA4Stickers;

  AlbumCollection({
    required this.albumId,
    this.ownedCommonStickers = const [],
    this.ownedFrameStickers = const [],
    this.ownedLegendStickers = const [],
    this.ownedA4Stickers = const [],
  });
}
