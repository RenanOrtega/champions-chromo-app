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
  final List<int> ownedStickers;

  AlbumCollection({
    required this.albumId,
    this.ownedStickers = const [],
  });
}
