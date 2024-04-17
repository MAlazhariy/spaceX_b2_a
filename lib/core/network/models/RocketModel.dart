
class rocketModel {
  String? name;
  String? description;
  String? wikipedia;
  int? cost;
  String? img;

  rocketModel(
      {required this.name,
      required this.description,
      required this.wikipedia,
      required this.cost,
      required this.img});
  factory rocketModel.fromJson(Map<String, dynamic> json) {
    return rocketModel(
      name: json['name'],
      description: json['description'],
      wikipedia: json['wikipedia'],
      cost: json['cost_per_launch'],
      img: json['flickr_images'][0],
    );
  }
}
