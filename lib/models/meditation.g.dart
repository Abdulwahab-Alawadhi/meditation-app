// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'meditation.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Meditation _$MeditationFromJson(Map<String, dynamic> json) => Meditation(
      id: json['id'] as int?,
      title: json['title'] as String?,
      file: json['file'] as String?,
    );

Map<String, dynamic> _$MeditationToJson(Meditation instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'file': instance.file,
    };
