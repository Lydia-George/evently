class EventModel {
  final String id;
  final String name;
  final String imageUrl;
  final String eventUrl;

  final String localDate;
  final String localTime;

  final String venueName;
  final String city;
  final String country;

  final String category;
  final String genre;
  final String status;

  final String? info;

  const EventModel({
    required this.id,
    required this.name,
    required this.eventUrl,
    required this.imageUrl,
    required this.localDate,
    required this.localTime,
    required this.venueName,
    required this.city,
    required this.country,
    required this.category,
    required this.genre,
    required this.status,
    this.info,
  });

  factory EventModel.fromJson(Map<String, dynamic> json) {
    final images = json['images'] as List? ?? [];

    final venues = json['_embedded'] ? ['venues'] as List? ?? [];

    final venue = venues.isNotEmpty ? venues.first as Map<String, dynamic> : <String, dynamic>{};

    final classifications = json['classifications'] as List? ?? [];

    final classification = classifications.isNotEmpty ? classifications.first as Map<String, dynamic> : <String, dynamic>{};

    return EventModel(
      id: json['id'] ?? '',
      name: json['name'] ?? '',
      eventUrl: json['url'] ?? '',
      imageUrl: images.isNotEmpty ? images.first['url'] ?? '' : '',
      localDate: json['dates']?['start']?['localDate'] ?? '',
      localTime: json['dates']?['start']?['localTime'] ?? '',
      status: json['dates']?['status']?['code'] ?? '',
      venueName: venue['name'] ?? '',
      city: venue['city']?['name'] ?? '',
      country: venue['country']?['name'] ?? '',
      category:
      classification['segment']?['name'] ?? '',
      genre: classification['genre']?['name'] ?? '',
      info: json['info'],


    );
  }
}
