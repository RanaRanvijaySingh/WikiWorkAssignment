// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'photo_api_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PhotoApiModel _$PhotoApiModelFromJson(Map<String, dynamic> json) =>
    PhotoApiModel(
      albumId: json['albumId'] as int?,
      id: json['id'] as int?,
      title: json['title'] as String?,
      url: json['url'] as String?,
      thumbnailUrl: json['thumbnailUrl'] as String?,
    );

Map<String, dynamic> _$PhotoApiModelToJson(PhotoApiModel instance) =>
    <String, dynamic>{
      'albumId': instance.albumId,
      'id': instance.id,
      'title': instance.title,
      'url': instance.url,
      'thumbnailUrl': instance.thumbnailUrl,
    };
