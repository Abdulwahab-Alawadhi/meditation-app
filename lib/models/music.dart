// ignore_for_file: public_member_api_docs, sort_constructors_first
//import 'package:dio/dio.dart';
import 'package:json_annotation/json_annotation.dart';

part 'music.g.dart';

@JsonSerializable()
class Music {
  int? id;
  String? title;
  String? file;

  Music({
    this.id,
    this.title,
    this.file,
  });

  factory Music.fromJson(Map<String, dynamic> json) => _$MusicFromJson(json);
  Map<String, dynamic> toJson() => _$MusicToJson(this);
}
