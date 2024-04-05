import 'dart:ui';

import 'package:equatable/equatable.dart';

class LanguageModel extends Equatable {
  final String code;
  final String title;
  final String image;

  Locale get locale => Locale(code);

  const LanguageModel({
    required this.image,
    required this.title,
    required this.code,
  });

  @override
  List<Object> get props => [code, title, image];
}
