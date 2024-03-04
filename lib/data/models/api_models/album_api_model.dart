import 'package:json_annotation/json_annotation.dart';

part 'album_api_model.g.dart';

@JsonSerializable()
class AlbumApiModel {
  const AlbumApiModel({this.id, this.title, this.userId});

  factory AlbumApiModel.fromJson(Map<String, dynamic> json) => _$AlbumApiModelFromJson(json);

  final int? userId;
  final int? id;
  final String? title;

  Map<String, dynamic> toJson() => _$AlbumApiModelToJson(this);
}
