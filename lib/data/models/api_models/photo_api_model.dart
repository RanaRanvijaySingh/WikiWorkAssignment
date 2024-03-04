import 'package:json_annotation/json_annotation.dart';

part 'photo_api_model.g.dart';

@JsonSerializable()
class PhotoApiModel {
  const PhotoApiModel({this.albumId, this.id, this.title, this.url, this.thumbnailUrl});

  factory PhotoApiModel.fromJson(Map<String, dynamic> json) => _$PhotoApiModelFromJson(json);

  final int? albumId;
  final int? id;
  final String? title;
  final String? url;
  final String? thumbnailUrl;

  Map<String, dynamic> toJson() => _$PhotoApiModelToJson(this);
}
