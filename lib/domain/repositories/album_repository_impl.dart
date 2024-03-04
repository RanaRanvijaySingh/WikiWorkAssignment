import 'package:wiki_work_assignment/domain/repositories/album_repository.dart';
import 'package:wiki_work_assignment/services/rest_client.dart';

import '../../data/models/api_models/album_api_model.dart';

class AlbumRepositoryImpl extends AlbumRepository {
  final RestClient _client;

  AlbumRepositoryImpl(this._client);

  @override
  Future<AlbumApiModel> addAlbum(AlbumApiModel album) => _client.addAlbum(album);

  @override
  Future<AlbumApiModel> deleteAlbum(int id) => _client.deleteAlbum(id);

  @override
  Future<List<AlbumApiModel>> getAlbums() => _client.getAlbums();
}
