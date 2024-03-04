import '../../data/models/api_models/album_api_model.dart';

abstract class AlbumRepository {
  Future<List<AlbumApiModel>> getAlbums();

  Future<AlbumApiModel> addAlbum(AlbumApiModel album);

  Future<AlbumApiModel> deleteAlbum(int id);
}
