import '../../data/models/api_models/photo_api_model.dart';

abstract class PhotoRepository {
  Future<List<PhotoApiModel>> getPhotos(int id);
}
