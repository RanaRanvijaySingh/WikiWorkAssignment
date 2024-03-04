import 'package:wiki_work_assignment/data/models/ui_models/photo_ui_model.dart';
import 'package:wiki_work_assignment/domain/mappers/photo_mapper.dart';
import 'package:wiki_work_assignment/domain/repositories/photo_repository.dart';
import 'package:wiki_work_assignment/domain/usecases/photo_usecases.dart';

class GetPhotosUseCaseImpl extends GetPhotosUseCase {
  late final PhotoRepository _photoRepository;
  late final PhotoMapper _mapper;

  GetPhotosUseCaseImpl(this._photoRepository, this._mapper);

  @override
  Future<List<PhotoUiModel>> getPhotos(int albumId) async {
    var response = await _photoRepository.getPhotos(albumId);
    return _mapper.getUiModel(response);
  }
}
