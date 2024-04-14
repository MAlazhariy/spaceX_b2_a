import 'package:equatable/equatable.dart';

class LaunchModel extends Equatable {
  final String id;

  const LaunchModel({
    required this.id,
  });

  factory LaunchModel.fromJson(Map<String, dynamic> json){
    return LaunchModel(id: json['id']);
  }

  @override
  List<Object> get props => [id];
}
