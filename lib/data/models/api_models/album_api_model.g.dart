// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'album_api_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AlbumApiModel _$AlbumApiModelFromJson(Map<String, dynamic> json) =>
    AlbumApiModel(
      id: json['id'] as int?,
      title: json['title'] as String?,
      userId: json['userId'] as int?,
    );

Map<String, dynamic> _$AlbumApiModelToJson(AlbumApiModel instance) =>
    <String, dynamic>{
      'userId': instance.userId,
      'id': instance.id,
      'title': instance.title,
    };
