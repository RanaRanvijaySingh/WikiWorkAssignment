import 'package:rxdart/rxdart.dart';
import 'package:wiki_work_assignment/data/models/ui_models/photo_ui_model.dart';
import 'package:wiki_work_assignment/domain/usecases/photo_usecases.dart';
import 'package:wiki_work_assignment/main.dart';
import 'package:wiki_work_assignment/utils/validation_utils.dart';

class GalleryBloc {
  final _getPhotoUseCase = getIt<GetPhotosUseCase>();
  final _subjectPhoto = BehaviorSubject<List<PhotoUiModel>>();

  Stream<List<PhotoUiModel>> get photoStream => _subjectPhoto.stream;

  fetchPhotos(int albumId) {
    _getPhotoUseCase.getPhotos(albumId).then((value) {
      if (ValidationUtils.isValidList(value)) {
        _subjectPhoto.add(value);
      } else {
        _subjectPhoto.addError(true);
      }
    });
  }

  void dispose() {
    _subjectPhoto.close();
  }
}
