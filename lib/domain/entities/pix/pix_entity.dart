class Pix {
  final String id;
  final int amount;
  final String status;
  final bool devMode;
  final String brCode;
  final String brCodeBase64;
  final int platformFee;
  final String customerId;
  final String description;
  final DateTime createdAt;
  final DateTime updatedAt;
  final DateTime expiresAt;

  Pix({
    required this.id,
    required this.amount,
    required this.status,
    required this.devMode,
    required this.brCode,
    required this.brCodeBase64,
    required this.platformFee,
    required this.customerId,
    required this.description,
    required this.createdAt,
    required this.updatedAt,
    required this.expiresAt,
  });
}
