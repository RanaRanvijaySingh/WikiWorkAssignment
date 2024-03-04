import 'package:rxdart/rxdart.dart';
import 'package:wiki_work_assignment/data/models/api_models/album_api_model.dart';
import 'package:wiki_work_assignment/domain/usecases/album_usecases.dart';
import 'package:wiki_work_assignment/main.dart';
import 'package:wiki_work_assignment/utils/validation_utils.dart';

import '../../data/models/ui_models/album_ui_model.dart';

class HomeBloc {
  final _getAlbumUseCase = getIt<GetAlbumsUseCase>();
  final _addAlbumUseCase = getIt<AddAlbumUseCase>();
  final _deleteAlbumUseCase = getIt<DeleteAlbumUseCase>();
  final _subjectAlbum = BehaviorSubject<List<AlbumUiModel>>();
  final _subjectProgress = BehaviorSubject<bool>();

  Stream<List<AlbumUiModel>> get albumStream => _subjectAlbum.stream;

  Stream<bool> get progressStream => _subjectProgress.stream;

  fetchAlbums() {
    _getAlbumUseCase.getAlbums().then((value) {
      if (ValidationUtils.isValidList(value)) {
        _subjectAlbum.add(value);
      }
    });
  }

  void dispose() {
    _subjectAlbum.close();
    _subjectProgress.close();
  }

  /// Have to add a new dummy album by making an api call.
  void addNewAlbum() {
    _subjectProgress.add(true);
    AlbumApiModel dummyAlbum = const AlbumApiModel(
      id: 1,
      userId: 1,
      title: "lorem ipsum",
    );
    _addAlbumUseCase.addAlbum(dummyAlbum).then((value) {
      if (value) {
        var list = _subjectAlbum.value;
        list.insert(0, const AlbumUiModel(id: 1, title: "Loren ipsum"));
        _subjectAlbum.add(list);
      }
    });
  }

  void delete(AlbumUiModel item) {
    _deleteAlbumUseCase.deleteAlbum(item.id!).then((value) {
      if (value) {
        var list = _subjectAlbum.value;
        list.remove(item);
        _subjectAlbum.add(list);
      }
    });
  }
}
