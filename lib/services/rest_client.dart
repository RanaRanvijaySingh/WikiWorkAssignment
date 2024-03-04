import 'package:dio/dio.dart';
import 'package:retrofit/http.dart';
import 'package:wiki_work_assignment/data/models/api_models/photo_api_model.dart';

import '../data/models/api_models/album_api_model.dart';

part 'rest_client.g.dart';

@RestApi(baseUrl: "https://jsonplaceholder.typicode.com/")
abstract class RestClient {
  factory RestClient(Dio dio, {String baseUrl}) = _RestClient;

  @GET('/albums')
  Future<List<AlbumApiModel>> getAlbums();

  @POST('/albums')
  Future<AlbumApiModel> addAlbum(@Body() AlbumApiModel album);

  @DELETE('/albums/{id}')
  Future<AlbumApiModel> deleteAlbum(@Path() int id);

  @GET('/albums/{id}/photos')
  Future<List<PhotoApiModel>> getPhotos(@Path() int id);
}
