// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'exercise.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Exercise _$ExerciseFromJson(Map<String, dynamic> json) => Exercise(
      id: json['id'] as int?,
      title: json['title'] as String?,
      file: json['file'] as String?,
      finished: json['finished'] as bool?,
    );

Map<String, dynamic> _$ExerciseToJson(Exercise instance) => <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'file': instance.file,
      'finished': instance.finished,
    };
