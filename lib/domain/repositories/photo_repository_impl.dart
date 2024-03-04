import 'package:wiki_work_assignment/data/models/api_models/photo_api_model.dart';
import 'package:wiki_work_assignment/services/rest_client.dart';
import 'package:wiki_work_assignment/domain/repositories/photo_repository.dart';

class PhotoRepositoryImpl extends PhotoRepository {
  final RestClient _client;

  PhotoRepositoryImpl(this._client);

  @override
  Future<List<PhotoApiModel>> getPhotos(int id) => _client.getPhotos(id);
}
