import 'package:json_annotation/json_annotation.dart';

part 'meditation.g.dart';

@JsonSerializable()
class Meditation {
  int? id;
  String? title;
  String? file;

  Meditation({
    this.id,
    this.title,
    this.file,
  });

  factory Meditation.fromJson(Map<String, dynamic> json) =>
      _$MeditationFromJson(json);
  Map<String, dynamic> toJson() => _$MeditationToJson(this);
}
