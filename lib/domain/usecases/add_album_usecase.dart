import 'package:wiki_work_assignment/data/models/api_models/album_api_model.dart';
import 'package:wiki_work_assignment/domain/repositories/album_repository.dart';
import 'package:wiki_work_assignment/domain/usecases/album_usecases.dart';

class AddAlbumUseCaseImpl extends AddAlbumUseCase {
  late final AlbumRepository _albumRepository;

  AddAlbumUseCaseImpl(this._albumRepository);

  @override
  Future<bool> addAlbum(AlbumApiModel request) async {
    final response = await _albumRepository.addAlbum(request);
    if (response != null) {
      return true;
    } else {
      return false;
    }
  }
}
