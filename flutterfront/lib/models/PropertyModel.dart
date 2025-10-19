class Property {
  final String id; 
  final String title;
  final String description;
  final String type; // "sale" أو "rent"
  final double price;
  final double? area;
  final int? rooms;
  final String status; // "pending", "approved", "sold", "rented"
  final String? city;
  final List<String> images;
  final String agentId;
  final int views;

  Property({
    required this.id,
    required this.title,
    required this.description,
    required this.type,
    required this.price,
    this.area,
    this.rooms,
    required this.status,
    this.city,
    required this.images,
    required this.agentId,
    required this.views,
  });
}
