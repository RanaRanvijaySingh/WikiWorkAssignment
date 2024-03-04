import 'package:wiki_work_assignment/data/models/ui_models/photo_ui_model.dart';

abstract class GetPhotosUseCase {
  Future<List<PhotoUiModel>> getPhotos(int id);
}
