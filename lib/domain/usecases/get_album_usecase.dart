import 'package:wiki_work_assignment/data/models/ui_models/album_ui_model.dart';
import 'package:wiki_work_assignment/domain/mappers/album_mapper.dart';
import 'package:wiki_work_assignment/domain/repositories/album_repository.dart';
import 'package:wiki_work_assignment/domain/usecases/album_usecases.dart';

class GetAlbumUseCaseImpl extends GetAlbumsUseCase {
  late final AlbumRepository _albumRepository;
  late final AlbumMapper _mapper;

  GetAlbumUseCaseImpl(this._albumRepository, this._mapper);

  @override
  Future<List<AlbumUiModel>> getAlbums() async {
    var response = await _albumRepository.getAlbums();
    return _mapper.getUiModel(response);
  }
}
