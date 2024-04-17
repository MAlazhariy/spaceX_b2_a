// todo: zak - file naming convention `snake_case`
// todo: zak - Move the file to its feature directory
// We are here using division by FEATURES not div by LAYERS.

// todo: zak - naming convention of the class `UpperCamelCase` instead of `lowerCamelCase`
// Classes should always be `UpperCamelCase`
// methods and variables should be `lowerCamelCase`
class rocketModel {
  // todo: zak - convert to non-null
  String name;
  String description;
  // todo: zak - change the name to make it more expressive
  String? wikipediaUrl;
  int? cost;
  String img;

  // todo: zak - prefer to make `const` and make the fields `final`
  rocketModel(
      {required this.name,
      required this.description,
      required this.wikipediaUrl,
      required this.cost,
      required this.img});

  factory rocketModel.fromJson(Map<String, dynamic> json) {
    final List flickrImages = json['flickr_images'];
    return rocketModel(
      name: json['name'] ?? '',
      // todo: what if description is null?
      description: json['description'] ?? '',
      wikipediaUrl: json['wikipedia'],
      cost: json['cost_per_launch'],
      // todo: zak - try to solve the BUG
      // 1. What if the `flickr_images` is empty?
      // 2. What if the `flickr_images` is null?
      img: json['flickr_images'][0],
    );
  }
}
