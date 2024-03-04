import 'dart:ffi';

import 'package:wiki_work_assignment/domain/repositories/album_repository.dart';
import 'package:wiki_work_assignment/domain/usecases/album_usecases.dart';

class DeleteAlbumUseCaseImpl extends DeleteAlbumUseCase {
  late final AlbumRepository _albumRepository;

  DeleteAlbumUseCaseImpl(this._albumRepository);

  @override
  Future<bool> deleteAlbum(int id) async {
    final response = await _albumRepository.deleteAlbum(id);
    if (response != null) {
      return true;
    } else {
      return false;
    }
  }
}
