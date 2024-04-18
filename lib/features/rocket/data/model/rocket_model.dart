class RocketModel {
  final String name;
  final String description;
  final String? wikipediaUrl;
  final int? cost;
  final String image;

  const RocketModel({
    required this.name,
    required this.description,
    required this.wikipediaUrl,
    required this.cost,
    required this.image,
  });

  factory RocketModel.fromJson(Map<String, dynamic> json) {
    final List? flickrImages = json['flickr_images'];

    return RocketModel(
      name: json['name'] ?? '',
      description: json['description'] ?? '',
      wikipediaUrl: json['wikipedia'],
      cost: json['cost_per_launch'],
      image: flickrImages?.isNotEmpty == true ? json['flickr_images'][0] : '',
    );
  }
}
