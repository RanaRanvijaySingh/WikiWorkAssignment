import 'package:wiki_work_assignment/data/models/api_models/album_api_model.dart';

import '../../data/models/ui_models/album_ui_model.dart';

abstract class GetAlbumsUseCase {
  Future<List<AlbumUiModel>> getAlbums();
}

abstract class AddAlbumUseCase {
  Future<bool> addAlbum(AlbumApiModel request);
}

abstract class DeleteAlbumUseCase {
  Future<bool> deleteAlbum(int id);
}
